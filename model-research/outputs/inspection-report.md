# Engine stems model: inspection and full-precision benchmark

Measured locally on 2026-09-11. Original model and Engine installation were not modified.

## Finding

This model runs successfully on the desktop CPU and RTX 5060 Ti GPU with float32 inputs, weights and outputs. GPU execution with TF32 explicitly disabled took approximately 34 ms per warm model call, 2.38 times faster than the best CPU configuration tested (81 ms). This supports accelerating the existing network without quantization. It does not prove unchanged audible quality or a corresponding improvement inside Engine DJ.

## Model

ONNX checker passed. PyTorch 2.3.1 export, opset 11, 489 graph nodes, 102,642,696 initializer elements (including non-trainable statistics/constants), 154 convolutions, 75 batch-normalization operators, 142 LeakyRelu operators. Encoder/decoder and mel projection names suggest a convolutional spectrogram encoder-decoder. No attention operators are present.

Input float32 [1,2,128,2048]; output float32 [1,8,128,2048]. These are model tensors, not PCM audio. Estimated convolution work is 27.41 billion multiply-accumulates per call, excluding matrix multiplications and other operations. Details and model SHA256 are in the inspection JSON files. No weights are included in these deliverables.

## Measurement

Intel i5-13600K, RTX 5060 Ti 16 GB, ONNX Runtime 1.30.0. One fixed seed-42 uniform-random float32 tensor, five timed calls after one warmup, sequential runs while normal desktop applications remained open. Timing includes session.run input/output transfers but excludes session creation and audio frontend/backend. This is a microbenchmark, not a music quality test or real-time latency measurement.

| Configuration | Warm median ms | Maximum absolute output difference* |
|---|---:|---:|
| cpu-2-none | 241.34 | 0 |
| cpu-2-basic | 243.60 | 0 |
| cpu-2-all | 195.13 | 5.84125519e-06 |
| cpu-4-all | 106.08 | 5.84125519e-06 |
| cpu-8-all | 80.63 | 5.84125519e-06 |
| gpu-2-all | 33.82 | 1.68085098e-05 |

*Reference: same ONNX Runtime, CPU, two threads, graph optimizations disabled. This is not the official Engine processor reference. All outputs were finite. Basic optimization was bit-identical on this input and supplied no measured speed improvement. Faster settings changed floating-point rounding slightly. GPU RMS output difference was 1.55e-6 and relative L2 difference was 3.39e-6; these are tensor error metrics, not audio SNR or separation-quality scores.

GPU provider was successfully selected with use_tf32=0, HEURISTIC convolution algorithm search and a 6 GiB CUDA arena limit. GPU session creation was 540 ms and first call 352 ms; warm calls were 33.6–34.8 ms. Keep a session loaded when integrating. CPU optimized eight-thread initialization was 548 ms. Do not count these warm results as cold-start results.

## Quality-preserving approach

1. Keep the existing weights, float32 precision, spectral transform, normalization, sample rate, context window, overlap, reconstruction and quality/residual flags identical to the reference.
2. On this PC, use the CUDA execution provider with use_tf32=0. CPU fallback can use the tested eight-thread setting, subject to concurrent playback measurements. Thread counts are hardware-specific.
3. Profile the existing processor before claiming new fusion benefits. ONNX Runtime already enables graph optimizations by default; the unoptimized baseline above deliberately disabled them. These gains are not demonstrated gains over the official Engine build.
4. To validate quality, capture actual input tensors from the original frontend and compare outputs against its predictor across representative tracks, silence and transients. Then reconstruct all four stereo stems using the unchanged backend, compare aligned PCM numerically, perform blind listening and measure whole-track rendering alongside playback.
5. FP16, TF32, INT8, pruning, smaller context and lower overlap are separate experiments that cannot be promised lossless. None was applied here.

## Raspberry Pi distinction

The existing project's STEMS-ASSESSMENT.md records a previous native Pi result of 26.169 seconds to render 30 seconds of audio with two threads, versus 29.798 seconds with three. Those are historical local project records, not rerun measurements in this task. They used highQuality=0 and residual=0; they do not establish maximum-quality throughput. Current Pi CPU model, load and native processor optimization settings were not verified.

The RTX results apply to this desktop only. For standalone Pi operation, the next useful test is the same FP32 graph on the Pi with its native optimized ARM runtime, keeping the official audio pipeline unchanged and measuring one versus two threads. Reusing an initialized worker and cached completed stems may reduce repeat/startup work but will not make neural inference intrinsically faster. Do not deploy a desktop-specific optimized graph to the Pi. Offloading inference to the desktop is a separate architecture with network and integration costs, not a standalone Pi speed claim.

## Integration limitation

The supplied official processor executable and dispatcher are AArch64 binaries. The ONNX file can be used directly on x86 with ONNX Runtime, but it is not a complete audio-to-stems application or a drop-in replacement for the official worker. Retaining its exact frontend/backend is required for a valid quality comparison. No Engine worker or installation was replaced.

## Reproduction

`benchmark.py` is the inspection harness used for these measurements. Run from the task workspace with `work/venv/bin/python outputs/benchmark.py --opt none`, then use `--threads 8 --opt all` or `--gpu`. The model path is the private local file; outputs are numerical measurements only. Raw per-configuration timings are in the adjacent JSON files. Test environment packages are pinned in `benchmark-requirements.txt`.

## Technical references

- [ONNX Runtime graph optimizations](https://onnxruntime.ai/docs/performance/model-optimizations/graph-optimizations.html): available fusions, default enablement and hardware-specific serialized graphs.
- [CUDA execution provider](https://onnxruntime.ai/docs/execution-providers/CUDA-ExecutionProvider.html): GPU execution and use_tf32=0 to disable TensorFloat-32 precision reduction.
- [ONNX Runtime threading](https://onnxruntime.ai/docs/performance/tune-performance/threading.html): intra-op thread tuning.
