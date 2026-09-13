# ARM FP16 execution checkpoint

The original ARM ONNX Runtime 1.16.3 executed a 62-node prefix of the selective FP16 model successfully under QEMU configured as Cortex-A76. Initialization took 0.288 seconds and one synthetic-input run took 9.093 seconds, with finite output. These are emulator measurements, not Pi performance.

The profiler identifies the selected encoder_block3 shortcut convolution as CPUExecutionProvider / NhwcFusedConv, with FP16 input and output tensors. This supports an actual FP16 kernel path rather than a visible conversion to an FP32 Conv. It does not establish accumulator precision or specific hardware instructions.

Across this prefix, profiled Cast time was 3.71 ms and Transpose time 14.36 ms, versus 248.37 ms for the single FP16 convolution and roughly 8.56 seconds for preceding FP32 convolutions. These proportions cannot be extrapolated to the entire model or hardware.

The full selective FP16 model did not finish within its 300-second emulator limit. No complete full-model profile or output was produced. The process was stopped by the timeout; no experiment remains running.

Conclusion: the original ARM runtime has an executable FP16 path worth further investigation. This is not a verified speedup or a quality breakthrough. Exact Engine input capture is still blocked by the missing local session material. No Pi access or production changes occurred.
