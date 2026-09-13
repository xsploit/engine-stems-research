#!/usr/bin/env python3
"""Create a private ARM-compatible FP32 candidate locally; never connects to a Pi.
Requires onnxruntime==1.16.3 and numpy<2. Fused ops require ONNX Runtime.
No x86 NCHWc layout optimization, reduced precision, or audio changes.
"""
import argparse,os
from pathlib import Path
import onnxruntime as ort
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('source',type=Path);p.add_argument('destination',type=Path)
a=p.parse_args()
if ort.__version__!='1.16.3':p.error('Use ONNX Runtime 1.16.3 to match the verified ARM runtime.')
if a.source.resolve()==a.destination.resolve():p.error('Destination must differ from source.')
if a.destination.exists():p.error('Destination already exists; choose a new path.')
a.destination.parent.mkdir(parents=True,exist_ok=True)
os.umask(0o077)
o=ort.SessionOptions();o.intra_op_num_threads=2;o.inter_op_num_threads=1
o.graph_optimization_level=ort.GraphOptimizationLevel.ORT_ENABLE_EXTENDED
o.optimized_model_filepath=str(a.destination)
s=ort.InferenceSession(str(a.source),o,providers=['CPUExecutionProvider'])
a.destination.chmod(0o600)
print('Created private FP32 candidate:',a.destination)
