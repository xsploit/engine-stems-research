# Executed static graph audit — 2026-09-13

Read the original local ONNX file without inference or modification. SHA256: c203bfa6bd53d16ef7ba6393540453f6cfd7541a87c169be5310989b8d987a0a.

Full inventory: graph-audit.json. Reproducer: ../../work/claude-stems-team/audit-graph.py. Learned weight values are not exported.

## Confirmed dataflow

1. Input named `input`, FP32 [1,2,128,2048]. Model/graph documentation and metadata contain no explanation of axes or stem identities.
2. `/Transpose` uses [0,3,2,1], so the 2048-wide original last axis becomes the channel axis for `/bn0/BatchNormalization`. Its four parameter/statistic vectors each have 2048 elements. A second identical transpose restores the original layout.
3. `/mel/Reshape` flattens to [256,2048]. `/mel/MatMul` multiplies by `mel.melW` of shape [2048,256]. `/mel/Reshape_1` restores [1,2,128,256]. Thus the graph projects the LAST input axis from 2048 to 256, preserving the 128 axis. The name suggests a mel projection but shape/name alone do not prove a particular mel formula or physical frequency calibration.
4. The convolutional encoder/decoder operates after that projection. The first convolution uses a spatially mean-subtracted weight tensor: `/zmfc/ReduceMean` consumes `zmfc.weight`, not audio activations. Its subtraction must not be mistaken for input mean removal.
5. `/after_conv2/Conv` produces the input to `/imel/Reshape` [1024,256]. `/imel/MatMul` uses `imel.melW` [256,2048], followed by reshape [1,8,128,2048]. `/Sigmoid` is the sole producer of output named `output`.
6. All 489 nodes use the listed standard operations. There is no FFT, inverse FFT, complex phase reconstruction or elementwise Mul node in this graph. Sigmoid bounds finite real logits into [0,1] subject to floating-point saturation; this supports, but does not establish, a mask interpretation.

## What this resolves

There is real in-graph normalization and a 2048-to-256-to-2048 projection. The earlier proposed 128-band interpretation is not the geometry of the operation named mel in this graph. The output is not multiplied by the original input inside this graph.

## What remains unknown

Actual PCM sample rate at the transform, FFT size, window definition, hop, boundary padding, external normalization, tensor-axis physical semantics, channel/stem order, output mask application, overlap-add and quality/residual-mode behaviour. Lack of an in-graph multiplication does not prove external masking. In-graph batch normalization does not rule out preprocessing outside the graph. No audio quality or runtime performance conclusion follows from this audit.
