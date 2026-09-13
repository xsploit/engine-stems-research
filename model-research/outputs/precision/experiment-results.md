# Stem model precision experiments

All experiments described here ran on the local PC. No Raspberry Pi deployment is proposed by this report.

## Findings

| Candidate | Local performance | Numerical result | Decision |
|---|---|---|---|
| FP32 opset 13 conversion | Essentially unchanged CPU time | Exact match on six proxy tensors | Useful conversion baseline |
| INT8 all convolutions | Faster in initial CPU measurements | Music relative L2 error roughly 86–93% | Reject current candidate |
| INT8 with protected edges | Initial CPU timing improved | Music error roughly 16–40% | Reject current candidate |
| INT8 deep layers only | 1.10× CPU speed | Music error 3.3–8.3% | Reject current candidate |
| FP16 deep layers only | CPU unchanged; GPU 1.05× | GPU music error 0.062–0.105% | Conservative research candidate |
| FP16 selective convolutions | CPU unchanged; GPU **1.74×** | GPU music error 0.169–0.365% | Best measured speed/error tradeoff; experimental |

Relative L2 is a tensor error measurement, not a percentage of audible quality lost. The selective FP16 candidate also has individual absolute output differences up to 0.333 on music proxies and 0.346 on silence. It is not yet validated for listening quality.

The first mean-centered convolution is exceptionally sensitive: rounding only its weights through FP16 caused up to 47.7% relative L2 error in the sensitivity sweep. Protecting it and the early encoder stages made mixed precision substantially more accurate. This shows that blanket quantization is a poor fit for the current model; it does not rule out carefully calibrated quantization.

The selective candidate uses FP16 convolution islands while retaining surrounding operations and sensitive stages in FP32. On the RTX 5060 Ti, seven alternating measurements gave medians of 35.41 ms for the original versus 20.38 ms for the candidate. ONNX Runtime was 1.30.0, CUDA TF32 was disabled, and the host session used four pinned P-core threads. This timing excludes the full audio frontend and reconstruction pipeline.

## Raspberry Pi implications

These GPU gains cannot be transferred to the Pi. CPU execution on this PC did not improve with mixed FP16. A local ARM emulation run using the original ARM runtime did not finish within its 120-second limit; this is neither a Pi benchmark nor evidence of an audio-quality failure.

The previously produced ARM FP32 optimized graph matched the original output on one synthetic tensor but had essentially unchanged emulated inference time. Its main measured gain was initialization time.

The next useful investigation is native ARM FP16 kernel coverage and conversion overhead, followed by testing with the exact Engine input preprocessing and reconstructed audio. Keep sensitive stages in FP32 and compare the conservative and broader FP16 candidates before considering deployment.

## Limits and evidence

Calibration and evaluation used spectral proxies from one local recording, with held-out positions, quiet input, and silence. They do not establish the exact Engine frontend or represent diverse musical material. Early broad INT8 timing was less controlled than the final pinned measurements. None of these candidates is declared deployment-ready.

Detailed measurements are in the adjacent `cpu-*.json`, `gpu-*.json`, and `weight-sensitivity.json` files. Candidate model weights remain private in the local experiment directory.
