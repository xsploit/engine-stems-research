# Local Engine input capture and ARM graph audit

The ARM64 interception library compiled and passed a QEMU harness test using the original ARM ONNX Runtime 1.16.3 library. It intercepted OrtApi.Run, saved all 524288 FP32 input elements with shape [1,2,128,2048], and the saved bytes matched the supplied tensor exactly. Input-only mode exits before model inference. Files are created with a private umask.

This validates the hook, not the Engine frontend. The existing original-processor protocol client needs session-material.private. The owning task confirmed that its prior copy was on the Pi only, with no known local copy. No Pi access was made to retrieve it. Actual Engine input capture therefore remains blocked.

While blocked, we initialized the selective FP16 model in the original ARM runtime under local QEMU and saved the fully optimized graph, without inference. All 127 FP16 convolution islands became com.microsoft NhwcFusedConv nodes retaining FP16 weights. The graph also contains 254 Cast nodes and 141 Transpose nodes; the other 27 convolutions retain FP32 weights.

This contradicts the simple hypothesis that the ARM optimizer necessarily converts every FP16 convolution back to FP32. It does not prove arithmetic accumulation precision or measured Pi performance. Layout conversions and cast overhead remain important profiling targets. Detailed node counts are in arm-kernel-graph-audit.json.

The original worker and model were not modified. The synthetic hook source and compiled library remain in work/arm-emulation for continuation.
