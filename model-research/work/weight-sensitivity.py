"""Measure FP16 weight-rounding sensitivity by model stage, on this PC only."""
import gc
import json
import os
from pathlib import Path
import importlib.util
import numpy as np
import onnx
from onnx import numpy_helper

spec = importlib.util.spec_from_file_location('experiment', Path(__file__).with_name('precision-experiments.py'))
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
os.sched_setaffinity(0, {0, 2, 4, 6})
_, all_inputs = e.make_inputs()
inputs = {k: all_inputs[k] for k in ['music_proxy_1', 'quiet_proxy', 'silence']}
reference = e.session(e.SOURCE / 'processor' / 'model.private.onnx')
refs = {k: reference.run(None, {'input': x})[0] for k, x in inputs.items()}
del reference
gc.collect()
m = onnx.load(e.WORK / 'fp32-opset13.private.onnx')
stages = {}
for node in m.graph.node:
    if node.op_type == 'Conv':
        stages.setdefault(node.name.split('/')[1], set()).update(node.input[1:])
results = []
for stage, names in stages.items():
    saved = {}
    for i, t in enumerate(m.graph.initializer):
        if t.name in names:
            saved[i] = t.SerializeToString()
            rounded = numpy_helper.to_array(t).astype(np.float16).astype(np.float32)
            t.CopyFrom(numpy_helper.from_array(rounded, t.name))
    s = e.session(m.SerializeToString())
    row = {'stage': stage, 'metrics': {k: e.metrics(refs[k], s.run(None, {'input': x})[0]) for k, x in inputs.items()}}
    results.append(row)
    print(json.dumps(row), flush=True)
    del s
    for i, data in saved.items():
        m.graph.initializer[i].ParseFromString(data)
    gc.collect()
e.write_json(e.OUT / 'weight-sensitivity.json', results)
