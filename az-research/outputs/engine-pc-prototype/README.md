> **2026-09-13 update:** Original Engine Desktop worker now ran successfully on this PC. Raw paired audio matches the prototype closely on one 30-second 44.1 kHz stereo input; independent numerical screening passed, listening remains pending. The old no-reference/Pi-session blocker below is superseded for the Windows worker. See [desktop validation](../engine-desktop-validation/README.md).

# Engine pipeline PC prototype and benchmark

Status: real audio rendered through the recovered pipeline and original FP32 ONNX model on the PC. This is an experimental reconstruction, not a verified Engine clone. No Pi access, deployment or BiteDJ changes. Automation remains paused.

## Measured on this PC

Intel i5-13600K, Linux x86-64, CPUExecutionProvider, ONNX Runtime 1.30.0, four inference threads. One existing30second stereo44100Hz raw fixture;11 model calls including the padded tail. No GPU or quantization used.

| Measurement | Result |
|---|---:|
| Audio length |30.00s|
| Model session initialization |0.436s|
| Render including audio processing and WAV writes |1.884s|
| Total including initialization |2.323s|
| Render speed |15.92x audio duration|
| First written audio including initialization |0.620s|
| Peak process resident RAM |904.1MiB|
| Average CPU cores used over measured total |3.82|

CPU usage is averaged process CPU time / elapsed time:3.82cores means about382% on tools where100% is one logical CPU, not382% of the whole computer. Peak RSS includes Python, input data, ONNX Runtime/model and buffers; it is not total system memory. Input reading/imports and final report/hash generation are outside the timed region. This is one short warm-environment file-render run, not sustained live DJ load, soundcard latency or Pi performance. First-output timing assumes a full model chunk is already available; live capture needs about2.97seconds to fill a chunk.

## Listen before trusting quality

- [Input](pc-cpu4/input.wav)
- [Stem 0](pc-cpu4/stem-0.wav)
- [Stem 1](pc-cpu4/stem-1.wav)
- [Stem 2](pc-cpu4/stem-2.wav)
- [Stem 3](pc-cpu4/stem-3.wav)
- [Residual](pc-cpu4/residual.wav)

Stem numbers are deliberate: semantic names remain unverified. No audio was played or judged by this task. Stem0 is relatively quiet on this fixture; that alone does not establish its identity or a defect. Residual is input minus summed reconstructed stems; reconstruction-plus-residual agreement is algebraic, not evidence of good separation.

All six files independently passed ffprobe: float32 stereo,44100Hz, exactly1323000frames. [Raw measurements](pc-cpu4/benchmark.json), [WAV checks](pc-cpu4/wav-validation.json).

## Implementation and correctness checks

[Renderer](render_benchmark.py) implements recovered Hann(n+1)/(N+1), history3072, FFT4096/hop1024,128frame model blocks, magnitude-only input, mask and EM postfilter, mixture phase, zero synthesis Nyquist, normalized overlap-add and latency/end trim. It uses NumPy FFT and ordinary IEEE division, rather than Engine's pffft/NEON kernels, and a newer runtime. Those numerical substitutions are explicit. No learned weights or private session material are bundled.

[Self-tests](checks/self-test.json) use a full-spectrum unity path to check waveform alignment and reconstruction at1,1023,128001,131072,261072frames; max error was under9e-8. Silence remains exactly zero through postfilter. These tests do not validate ONNX stem quality or prove the reverse-engineered EM formula against the binary. No original Engine rendered PCM pair is available, so there is no Engine equivalence or listening pass.

## Manual isolated Pi test later

Copy the two scripts and use your existing private model/input locally on the Pi. A native Python environment with numpy and onnxruntime must already work; the scripts do not install anything or connect to devices. Start with2threads, using the same input hash for comparison:

```bash
PYTHON=/path/to/venv/bin/python ./run-benchmark.sh /path/to/model.private.onnx /path/to/input-30s.f32 2 ./pi-cpu2
```

The wrapper runs framing checks first, then produces five stem/residual WAVs, an input WAV and benchmark.json recording runtime, architecture, threads, real-time factor, per-block timings, average CPU cores and peak RSS. Only run the actual model on the Pi when you choose to. Compare the saved WAVs and listen before any performance tuning or adoption. This measures this NumPy reconstruction on ARM, not the original Engine worker. An ARM package/runtime mismatch is a setup failure, not a model-speed result.
