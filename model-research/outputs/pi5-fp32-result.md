# Engine DJ stem model: Pi 5 FP32 optimization result

The candidate model was built and tested only on this PC. No Pi connection, deployment, or Pi execution was used for this final build.

## Result

`model.pi5.fp32-optimized.private.onnx` is a Pi 5 / Cortex-A76-targeted ONNX graph generated with Engine's ARM ONNX Runtime 1.16.3 inside QEMU. It retains float32 weights, inputs, outputs, tensor shapes, and model operations. No quantization, pruning, reduced context, lower overlap, or altered audio preprocessing was applied.

The optimized graph has 393 nodes instead of 489. It replaces eligible convolution sequences with 78 `com.microsoft:FusedConv` nodes and folds ten eligible additions into convolutions. The file remains approximately 392 MB because the trained weights dominate its size.

## Compatibility and output check

- Original model SHA-256: `c203bfa6bd53d16ef7ba6393540453f6cfd7541a87c169be5310989b8d987a0a`
- Candidate SHA-256: `533a927e3df1650712e8bb1c487ce9530b0722b1f8252763f2e3ac0358b7825b`
- Original ARM runtime: ONNX Runtime 1.16.3 from `libNNPredictionDispatcher_on.so`
- Emulated CPU: Cortex-A76
- Input/output shapes: `[1,2,128,2048]` to `[1,8,128,2048]`, float32
- Candidate passed the ONNX checker.
- Original and candidate ARM outputs were bit-for-bit identical for the fixed synthetic test tensor: maximum absolute difference `0`, RMS difference `0`.
- An earlier 403-node portable candidate passed seven PC comparisons covering silence, quiet input, wide dynamic range, random input, and three music-spectrum proxies. Those results are exploratory evidence for that earlier candidate, not seven additional tests of the final 393-node ARM candidate.

The final candidate has demonstrated numerical identity on one ARM-emulated input. This does not establish equality on all inputs or replace full audio reconstruction and listening tests because the extracted model accepts spectrogram-like tensors rather than PCM audio.

## Performance finding

The ARM emulator measured 50.64 seconds for one original-model call and 50.03 seconds for the preoptimized candidate. Session creation fell from 1.00 seconds to 0.44 seconds. QEMU timing does not predict Pi speed, and the roughly 1.2% call difference is too small to treat as a real inference improvement.

The reason is straightforward: Engine's runtime already enables the same graph optimization when loading the original model. Saving the optimized graph ahead of time removes optimization work from startup, but it does not materially change the graph ultimately executed.

The candidate is therefore useful as a verified FP32 preoptimized artifact and may reduce preparation time. It is not evidence of faster whole-track stem rendering.

## Integration constraint

The official `stems-processor` embeds the original ONNX bytes inside its executable; it does not load this extracted file by path. The candidate cannot be dropped beside the processor and expected to take effect. Integrating it requires a separate patched worker build or an exact resource replacement, followed by protocol-level PCM comparison. Neither was deployed or attempted on the Pi.

Meaningful additional speed without lowering model quality will likely require a faster ARM convolution backend or different hardware. FP16, INT8, pruning, smaller windows, and reduced overlap may improve throughput but can change separation quality and were deliberately excluded.

## Files

- `model.pi5.fp32-optimized.private.onnx`: private optimized candidate, mode 0600
- `arm-emulation-final-result.json`: final 393-node ARM candidate comparison
- `arm-emulation-result.json`: earlier 403-node ARM comparison, which showed small numerical differences
- `pc-portable-validation.json`: earlier 403-node candidate's PC numerical validation details
- `build-arm-fp32.sh`: local-only reproducible ARM/QEMU builder
- `optimize-arm-fp32.c`: ARM optimizer helper
- `arm-emulation-check.c`: ARM inference comparison helper
