"""Build narrower precision candidates after stage sensitivity measurements."""
import importlib.util
import json
from pathlib import Path
import numpy as np
import onnx
from onnx import helper, numpy_helper
from onnxruntime.quantization import QuantFormat, QuantType, quantize_static

spec = importlib.util.spec_from_file_location('experiment', Path(__file__).with_name('precision-experiments.py'))
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
base = e.WORK / 'fp32-opset13.private.onnx'
deep = {'encoder_block5', 'encoder_block6', 'conv_block7a', 'conv_block7b', 'conv_block7c', 'conv_block7d', 'decoder_block1', 'decoder_block2'}

model = onnx.load(base)
names = [n.name for n in model.graph.node if n.op_type == 'Conv' and n.name.split('/')[1] in deep]
dest = e.WORK / 'int8-deep-only.private.onnx'
quantize_static(base, dest, None, quant_format=QuantFormat.QDQ, op_types_to_quantize=['Conv'],
                nodes_to_quantize=names, per_channel=True, activation_type=QuantType.QInt8,
                weight_type=QuantType.QInt8, calibration_cache_path=e.WORK / 'calibration-cache.json',
                extra_options={'ActivationSymmetric': False, 'WeightSymmetric': True})
e.write_json(e.OUT / 'int8-deep-only-build.json', {'bytes': dest.stat().st_size, 'quantized_convs': len(names), 'stages': sorted(deep)})
print('Built int8-deep-only:', len(names), 'convolutions', flush=True)

for name, stages in [('fp16-deep-only', deep), ('fp16-selective-conv', deep | {'encoder_block3', 'encoder_block4', 'decoder_block3', 'decoder_block4', 'decoder_block5', 'decoder_block6'})]:
    m = onnx.load(base)
    initializers = {t.name: t for t in m.graph.initializer}
    added_weights = {}
    nodes = []
    converted = 0
    for node in m.graph.node:
        if node.op_type != 'Conv' or node.name.split('/')[1] not in stages:
            nodes.append(node)
            continue
        converted += 1
        cast_input = node.name + '/fp16_input'
        nodes.append(helper.make_node('Cast', [node.input[0]], [cast_input], name=node.name+'/CastInputFP16', to=onnx.TensorProto.FLOAT16))
        node.input[0] = cast_input
        for i in range(1, len(node.input)):
            source = node.input[i]
            target = source + '/fp16'
            if target not in added_weights:
                added_weights[target] = numpy_helper.from_array(numpy_helper.to_array(initializers[source]).astype(np.float16), target)
            node.input[i] = target
        original_output = node.output[0]
        half_output = original_output + '/fp16'
        node.output[0] = half_output
        nodes.append(node)
        nodes.append(helper.make_node('Cast', [half_output], [original_output], name=node.name+'/CastOutputFP32', to=onnx.TensorProto.FLOAT))
    del m.graph.node[:]
    m.graph.node.extend(nodes)
    used = {value for node in nodes for value in node.input}
    retained = [tensor for tensor in m.graph.initializer if tensor.name in used]
    del m.graph.initializer[:]
    m.graph.initializer.extend(retained)
    m.graph.initializer.extend(added_weights.values())
    m = onnx.shape_inference.infer_shapes(m)
    onnx.checker.check_model(m)
    path = e.WORK / (name+'.private.onnx')
    onnx.save(m, path)
    e.write_json(e.OUT / (name+'-build.json'), {'bytes': path.stat().st_size, 'fp16_convs': converted, 'stages': sorted(stages), 'other_operations': 'FP32; explicit Cast only at selected Conv boundaries'})
    print('Built', name, converted, 'convolutions', flush=True)
