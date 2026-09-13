"""Local-only precision exploration. No Pi connection or deployment.

Calibration uses spectral proxies from a local 30-second recording. These are
NOT captured Engine frontend tensors and cannot establish audible quality.
"""
import argparse
import gc
import hashlib
import json
import os
import time
from pathlib import Path

import numpy as np
import onnx
import onnxruntime as ort
from onnxruntime.quantization import CalibrationDataReader, QuantFormat, QuantType, quantize_static
from onnxruntime.quantization.calibrate import CalibraterBase
from onnxruntime.transformers.float16 import convert_float_to_float16, DEFAULT_OP_BLOCK_LIST

ROOT = Path(__file__).resolve().parents[1]
SOURCE = Path('/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi/stems-static')
WORK = ROOT / 'work' / 'precision'
OUT = ROOT / 'outputs' / 'precision'
WORK.mkdir(exist_ok=True)
OUT.mkdir(parents=True, exist_ok=True)
os.umask(0o077)

def write_json(path, value):
    path.write_text(json.dumps(value, indent=2))

def make_inputs():
    pcm = np.fromfile(SOURCE / 'input-30s.f32', dtype=np.float32).reshape(-1, 2)
    hann = np.hanning(4096)
    def spectrum(start, gain=1.0):
        frames = np.stack([pcm[start+j*1024:start+j*1024+4096].T * hann for j in range(128)], axis=1)
        return np.ascontiguousarray((np.abs(np.fft.rfft(frames, axis=-1)[..., :2048]) * gain)[None], dtype=np.float32)
    calibration = [spectrum(start, gain) for start in [0, 300000, 600000, 900000] for gain in [0.25, 1.0, 2.0]]
    evaluation = {f'music_proxy_{i}': spectrum(start) for i, start in enumerate([150000, 450000, 750000, 1100000])}
    evaluation['quiet_proxy'] = spectrum(450000, 0.01)
    evaluation['silence'] = np.zeros((1, 2, 128, 2048), np.float32)
    return calibration, evaluation

class Reader(CalibrationDataReader):
    def __init__(self, samples):
        self.samples = iter(samples)
    def get_next(self):
        x = next(self.samples, None)
        return None if x is None else {'input': x}

def calibration_session(self):
    # Limit only this experiment's calibration session, not any installation.
    options = ort.SessionOptions()
    options.intra_op_num_threads = 4
    options.inter_op_num_threads = 1
    options.graph_optimization_level = ort.GraphOptimizationLevel.ORT_DISABLE_ALL
    self.infer_session = ort.InferenceSession(self.augmented_model_path, options, providers=self.execution_providers)

def build():
    CalibraterBase.create_inference_session = calibration_session
    basic = ROOT / 'work' / 'candidates' / 'portable-basic.private.onnx'
    m = onnx.load(basic)
    m = onnx.version_converter.convert_version(m, 13)
    m = onnx.shape_inference.infer_shapes(m)
    base = WORK / 'fp32-opset13.private.onnx'
    onnx.save(m, base)
    convs = [n.name for n in m.graph.node if n.op_type == 'Conv']
    protected = [name for name in convs if any(part in name for part in ['/zmfc/', '/encoder_block1/', '/decoder_block6/', '/after_conv'])]
    calibration, _ = make_inputs()
    for name, excluded in [('int8-all-conv', []), ('int8-protected-edges', protected)]:
        dest = WORK / (name + '.private.onnx')
        if dest.exists() and (OUT / (name + '-build.json')).exists():
            continue
        t = time.perf_counter()
        quantize_static(base, dest, Reader(calibration), quant_format=QuantFormat.QDQ,
                        op_types_to_quantize=['Conv'], per_channel=True,
                        activation_type=QuantType.QInt8, weight_type=QuantType.QInt8,
                        nodes_to_exclude=excluded, calibration_providers=['CPUExecutionProvider'],
                        calibration_cache_path=WORK / 'calibration-cache.json',
                        extra_options={'ActivationSymmetric': False, 'WeightSymmetric': True})
        result = {'candidate': name, 'bytes': dest.stat().st_size,
                  'conv_count': len(convs), 'quantized_convs': len(convs)-len(excluded),
                  'protected_convs': excluded, 'build_seconds': time.perf_counter()-t}
        write_json(OUT / (name + '-build.json'), result)
        print(json.dumps(result), flush=True)
        gc.collect()
    blocks = sorted(set(DEFAULT_OP_BLOCK_LIST) | {'BatchNormalization', 'MatMul', 'ReduceMean', 'Sub', 'Sigmoid'})
    half = convert_float_to_float16(onnx.load(base), keep_io_types=True, op_block_list=blocks)
    # The converter appends input Cast nodes after their consumers. Sort the
    # generated graph without changing its computation before ONNX validation.
    known = {x.name for x in half.graph.input} | {x.name for x in half.graph.initializer} | {''}
    pending = list(half.graph.node)
    ordered = []
    while pending:
        ready = [node for node in pending if set(node.input) <= known]
        if not ready:
            raise RuntimeError('FP16 graph has unresolved inputs or a cycle.')
        for node in ready:
            ordered.append(node)
            known.update(node.output)
            pending.remove(node)
    del half.graph.node[:]
    half.graph.node.extend(ordered)
    half_path = WORK / 'fp16-conv-fp32-sensitive.private.onnx'
    onnx.save(half, half_path)
    onnx.checker.check_model(half)
    result = {'candidate': 'fp16-conv-fp32-sensitive', 'bytes': half_path.stat().st_size,
              'fp32_operator_types': blocks}
    write_json(OUT / 'fp16-conv-fp32-sensitive-build.json', result)
    print(json.dumps(result), flush=True)

def session(path, gpu=False):
    o = ort.SessionOptions()
    o.intra_op_num_threads = 4
    o.inter_op_num_threads = 1
    o.add_session_config_entry('session.intra_op.allow_spinning', '0')
    o.graph_optimization_level = ort.GraphOptimizationLevel.ORT_ENABLE_ALL
    providers = ['CPUExecutionProvider']
    if gpu:
        ort.preload_dlls(directory='')
        providers = [('CUDAExecutionProvider', {'use_tf32': '0', 'cudnn_conv_algo_search': 'HEURISTIC', 'gpu_mem_limit': str(4*1024**3)}), 'CPUExecutionProvider']
    s = ort.InferenceSession(path if isinstance(path, bytes) else str(path), o, providers=providers)
    if gpu and s.get_providers()[0] != 'CUDAExecutionProvider':
        raise RuntimeError('GPU provider failed; do not record fallback as GPU speed.')
    return s

def metrics(reference, candidate):
    d = candidate.astype(np.float64) - reference
    absolute = np.abs(d)
    return {'finite': bool(np.isfinite(candidate).all()), 'max_abs': float(absolute.max()),
            'mean_abs': float(absolute.mean()), 'rms': float(np.sqrt(np.mean(d*d))),
            'p99_abs': float(np.quantile(absolute, .99)),
            'relative_l2': float(np.linalg.norm(d)/max(float(np.linalg.norm(reference)), 1e-30)),
            'fraction_abs_above_0_01': float(np.mean(absolute > .01))}

def evaluate(gpu=False, requested=None):
    _, samples = make_inputs()
    reference = session(SOURCE / 'processor' / 'model.private.onnx', gpu)
    refs = {k: reference.run(None, {'input': x})[0] for k, x in samples.items()}
    candidates = ['fp32-opset13', 'fp16-conv-fp32-sensitive'] if gpu else ['fp32-opset13', 'int8-all-conv', 'int8-protected-edges', 'fp16-conv-fp32-sensitive']
    if requested:
        candidates = requested.split(',')
    x = samples['music_proxy_1']
    for name in candidates:
        path = WORK / (name + '.private.onnx')
        label = ('gpu-' if gpu else 'cpu-') + name
        try:
            s = session(path, gpu)
            comparisons = {key: metrics(refs[key], s.run(None, {'input': value})[0]) for key, value in samples.items()}
            baseline_times, candidate_times = [], []
            for i in range(7):
                order = [(reference, baseline_times), (s, candidate_times)]
                if i % 2:
                    order.reverse()
                for runner, dest in order:
                    t = time.perf_counter()
                    runner.run(None, {'input': x})
                    dest.append(time.perf_counter()-t)
            result = {'candidate': name, 'device': 'RTX 5060 Ti' if gpu else 'i5-13600K CPU, four threads',
                      'runtime': ort.__version__, 'providers': s.get_providers(), 'bytes': path.stat().st_size,
                      'original_median_seconds': float(np.median(baseline_times)),
                      'candidate_median_seconds': float(np.median(candidate_times)),
                      'speedup': float(np.median(baseline_times)/np.median(candidate_times)),
                      'original_seconds': baseline_times, 'candidate_seconds': candidate_times,
                      'output_metrics': comparisons,
                      'limitation': 'Spectral proxies from one local recording, not exact Engine frontend tensors. Not audible-quality validation or Pi speed.'}
            del s
            gc.collect()
        except Exception as e:
            result = {'candidate': name, 'error': str(e)}
        write_json(OUT / (label + '.json'), result)
        print(json.dumps(result), flush=True)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('action', choices=['build', 'cpu', 'gpu'])
    parser.add_argument('--candidates')
    args = parser.parse_args()
    if args.action == 'build':
        build()
    else:
        os.sched_setaffinity(0, {0, 2, 4, 6})
        evaluate(args.action == 'gpu', args.candidates)
