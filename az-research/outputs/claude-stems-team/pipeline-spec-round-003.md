SUPERVISOR NOTE: This is a substantial static specification, not yet complete: exact trim and backend packing remain hypotheses. The claim that Nyquist storage is NEVER written is not established by merely failing to find a clear; treat N1 as an unresolved initialization/write-provenance question, not a confirmed defect.

# Engine stems processor: consolidated static spec (44.1 kHz stereo path)
Binary: stems-processor 1.4.0 (zplane Stems-Pro LinuxARM 1.1.0) sha256 3c6f1cb7...; dispatcher sha256 3ffdda6e...
Status: STATIC-SPEC-COMPLETE for 44.1 kHz stereo, DYNAMIC-VALIDATION-PENDING. No runtime equivalence is claimed.
Tags: [P] proven by decoded dataflow; [H] hypothesis (reason given); [B] blocked. Addresses are in the stems-processor unless marked (disp).
This file supersedes contradictory text in the append-only PIPELINE-DETAILS.md.

## 0. Constants and parameters [P]
fs=44100 (f32 0x472c4400), N=4096, H=1024, F=128 frames per model call, K=2048 model bins, S=4 stems, M=2 model channels.
Ctor 0x10f10-0x10f4c; rodata 0x33b70/0x33b80.
Protocol (main 0x5744-0x5a80): numChannels C, sampleRate, maxBlockSize, highQuality (parsed, DISCARDED 0x57d8), residual R, numThreads.
initialize(C, fs, maxBlockSize, threads, R).
B = F*H = 131072 input samples per model call (getInputBlockSize 0x12750). L = N - H = 3072 (Hopping +0x78/+0x80 = algorithm +0x2a8/+0x2b0).

## 1. Initial state [P]
Prepare zero-clears: Hopping frame buffers (Hopping::prepare clear 0x173b4), residual history (0x14dcc), residual scratch (0x14cf4), OLA accumulators and normAcc (0x17a50/0x17a74). First-call flag +0xac8=1 (0x14330).
Buffers are allocated with aligned_alloc (0x215f4), so they are uninitialised unless cleared. StemsPro::reset is not called by main (no call site); init relies on prepare.

## 2. Chunk schedule [P]
Host FIFO (StemsProImpl 0xea00) accumulates input. Each full B-sample block -> StemsProAlgorithm::process (0x16290) -> exactly one predict.
Frames of block b: for f=0..127, hop = x[b*B + f*H : +H]; per channel buf = shiftLeft(buf, H) ++ hop (0x24428); frame[b,f,c] = buf (last N samples, zero history before the stream start).

## 3. Analysis and tensor [P]
w[n] = 0.5*(1 - cos(2*pi*(n+1)/(N+1))), n=0..N-1, f32 with cosf (0x1ec80).
Xc[f,k] = pffft_forward(frame*w) packed by setFFTResult (0x25110) into re/im k=0..2048.
Model input  I[c,f,k] = sqrt(re^2+im^2), k=0..2047 (0x246f8). Buffer index c*F*K + f*K + k (planar, 0x14548). ONNX [1,2,128,2048].
Phase P[c,f,k] = atan2f(im, re) (0x24800), stored and not given to the model.
Mono (C=1): I[1] = I[0] copy (0x15790).

## 4. Model output -> stem magnitude [P]
O = ONNX [1,8,128,2048], memmoved planar (0x1584c). Model channel j = s*2 + c.
Stereo: Est[s,c,f,k] = O[s*C+c,f,k] * I[c,f,k] (0x158e0).  Mono: Est[s,0] = O[s*2] * I[0] (0x15e24); O[s*2+1] is unused.
EM (0x128b0; EM indexes Est by s*M + c at 0x128f0; mono calls c=0 at 0x15e9c). Kernel operand order verified (Sub_I 0x25d5c, Div_I 0x26a68):
  D = (X - E)^2 + eps;  xi = E^2/D;  g = X^2/D;  v = g*xi/(1+xi);  E <- E*sqrt(v^2 + 0.7212*v)/(g + eps)
  with X=I[c,f,k], E=Est[s,c,f,k], eps=1.1920929e-07 (0x14338), 0.7212 = f32 0x3f38a090.
Numerics: NEON Div_I main loop = dst*recip where recip = frecpe(src) refined by two frecps steps (not IEEE division); tails use fdiv. Sub/Mul/Sqrt NEON; AddC generic fadd. Table: 16-dispatch-table.txt (static init zplVecLibDispatcher(-1) 0x7888 -> generic then ArmNeon 0x21f5c).

## 5. Synthesis [P unless marked]
Complex Y[s,c,f,k] for k<2048: re=(f32)((double)E*cos(P[c])), im=(f32)((double)E*sin(P[c])) (0x24c48). Mixture phase of the same input channel.
copyFFTResult (0x25298): buf[2k]=re[k], buf[2k+1]=im[k] for k<2048; then buf[1]=re[2048] (overwrites im[0]).
  => im[0] is dropped (DC is real only; its sign is kept through cos(P)).
  => NYQUIST ON SYNTHESIS: re[2048] of complex block +0x690 is NEVER written by the pipeline (setMagnitudeAndPhase count=2048; no prepare clear found; allocated by aligned_alloc 0x147c4). Its value is whatever the allocator returned, constant across frames. [P: never written; H: content likely 0 on fresh pages, not guaranteed]
Time frame t = (1/4096) * pffft_backward(buf) (scale 0x1d860-0x1d878; Fft mode 0 keeps p=1.0, 0x1e71c/0x1e728).
OLA per output channel (s*C+c; mono s), per frame (0x192b4-0x19498):
  normAcc[0..N) += w^2;  acc[c] += t*w;  out = acc[0..H)/normAcc[0..H);  shift acc and normAcc left by H, zero-fill.
Output position: frame f of block b -> out samples b*B + f*H .. +H.
Residual (R=1): hist = last B+L input samples (cleared at start, shiftLeftAndInsert B per block, 0x15468). Res[c] = hist[c][0..B) - sum_s stem[s,c] (0x15c40/0x15c8c/0x15cb0). Written to out channel 4*C + c (stereo 0x15d04; mono index 4, 0x161d0).
Output channels: [s0 c0..cC-1][s1]..[s3][res if R] (getInstrumentOutputChannels 0x127d0).

## 6. Latency, start, end [P unless marked]
Algorithm first block: out[0..L) zero-filled for all output channels (0x15b28).
StemsProImpl drops the first L FIFO output samples: readIdx += L (0xee38-0xee48, flag +0xc78). The copy loop 0xed08-0xed38 writes into scratch block +0xaf8 (ptrs +0xb10), not the host buffer.
End: finishProcessing (0xf190) zero-pads the remainder to B (clear 0xf274), processes it (0xf344), processes an extra zero block if L > pad (0xf294/0xf5b4), and advances the FIFO write index by partial counts (0xf4d8, 0xf730). main then loops flushBuffer (0x6184), which emits min(outputBlockSize, FIFO fill) (0xfe20-0xfe28) until 0.
Host-visible length = input length: [H-strong] static trim formula only partially decoded (0xf4f0-0xf504 uses +0xc84 + remaining + (x0 - B)). Corroborated by historical native records in STEMS-ASSESSMENT.md: 132300 / 529200 / 1323000 returned frames for 3 / 12 / 30 s renders (not re-measured).

## 7. FFT backend [P wrapper; H-strong backend semantics]
pffft (create 0x2da28 via table 0x18800150). Forward: copy, zero-pad, rectangle window, pffft_transform_ordered (0x325c0 -> internal ordered=1).
Ordered REAL layout assumed [r0, r(N/2), r1, i1, ...] (upstream pffft convention "F(0)+i*F(N/2) in first entry"; consistent with the setFFTResult/copyFFTResult fix-ups). Upstream pffft is unscaled both ways; no scale constant found in pffft_transform_internal (0x31ce8-0x324e0; only the internal sqrt(1/2) in pffft_real_finalize 0x30384). pffft_zreorder SIMD (0x315f0) not decoded line by line.

## 8. Remaining uncertainties
U1 [H-strong] pffft ordered layout/unscaled semantics (no local source; decode 0x315f0-0x31840 or compare with upstream pffft).
U2 [H-strong] exact trim formula (0xf4e4-0xf504, 0xf5d0-0xf6f0, 0xf968-0xfa00).
N1 [H] synthesis Nyquist re[2048] content (allocator dependent). Dynamic check: capture block +0x690 or compare Nyquist energy in original output.
U6 resampler path (fs != 44100): out of scope.
U7 bit-exact frecpe emulation: out of scope for the static map.
[B] stem identity of s=0..3: not in the processor; needs parent evidence.
[B] runtime equivalence: needs a session-gated original run plus PCM comparison and listening.
