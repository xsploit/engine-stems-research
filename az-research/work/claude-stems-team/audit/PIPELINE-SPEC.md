# Engine stems processor: consolidated static spec (44.1 kHz stereo path)
Binary: stems-processor 1.4.0 (zplane Stems-Pro LinuxARM 1.1.0) sha256 3c6f1cb7...; dispatcher sha256 3ffdda6e...
Status (round 6, final static): 44.1 kHz stereo/mono processor pipeline statically specified, including end trim (host frames = T) and synthesis Nyquist = 0 (prepare clear).
pffft packing (DC real + i*Nyquist in first entry) and unscaled forward/backward are SOURCE-CORROBORATED ASSUMPTIONS (PFFFT-SOURCE-NOTE.md, AOSP pffft.h), not proven binary-revision equivalence.
Stem identity s=0..3 -> Vocal/Drums/Bass/Melody: BLOCKED (see section 9). DYNAMIC-VALIDATION-PENDING; no runtime equivalence claimed.
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
Complex Y[s,c,f,k] for k<2048: re=(f32)((double)E*cos(P[c])), im=(f32)((double)E*sin(P[c])) (0x24c48; count = view len 2048 at 0x159e4, offset 0).
Synthesis complex block +0x690: frames = capacity = getNumFftBins = 2049 (0x13cac -> 0x13dd4), offset 0 (0x13dd8). Per-channel vectors in +0x6d0, aligned_alloc (0x147c4).
  prepare zero-clears BOTH halves over all 2049 bins for every channel: memset re (0x13ff4) and im (0x14004); scalar fallback 0x14388.
  Storage/pointer fields (+0x6a0..+0x6f8) are referenced only by the ctor, prepare, releaseResources, reset and dtor. computeOutputTensor uses +0x6a0 only as the setMagnitudeAndPhase dst (writes 2048 bins) and as the transformInverse src (const view).
  => re[2048] = im[2048] = 0 for the whole stream [P within these referencing functions; no other reference to the fields found].
copyFFTResult (0x25298): buf[2k]=re[k], buf[2k+1]=im[k] for k<2048; then buf[1]=re[2048]=0 (0x253cc, overwrites im[0]).
  => NYQUIST ON SYNTHESIS = 0; im[0] is dropped (DC real only, sign kept via cos(P)). The model input also excludes Nyquist.
Time frame t = (1/4096) * pffft_backward(buf) (scale 0x1d860-0x1d878; Fft mode 0 keeps p=1.0, 0x1e71c/0x1e728).
OLA per output channel (s*C+c; mono s), per frame (0x192b4-0x19498):
  normAcc[0..N) += w^2;  acc[c] += t*w;  out = acc[0..H)/normAcc[0..H);  shift acc and normAcc left by H, zero-fill.
Output position: frame f of block b -> out samples b*B + f*H .. +H.
Residual (R=1): hist = last B+L input samples (cleared at start, shiftLeftAndInsert B per block, 0x15468). Res[c] = hist[c][0..B) - sum_s stem[s,c] (0x15c40/0x15c8c/0x15cb0). Written to out channel 4*C + c (stereo 0x15d04; mono index 4, 0x161d0).
Output channels: [s0 c0..cC-1][s1]..[s3][res if R] (getInstrumentOutputChannels 0x127d0).

## 6. Latency, start, end [P unless marked]
Algorithm first block: out[0..L) zero-filled for all output channels (0x15b28).
StemsProImpl drops the first L FIFO output samples: readIdx += L (0xee38-0xee48, flag +0xc78). The copy loop 0xed08-0xed38 writes into scratch block +0xaf8 (ptrs +0xb10), not the host buffer.
End (decoded; integer check in 19-trim-arithmetic.txt). Notation: T = total input frames, B = 131072, L = 3072, input to finish n = T - q*B with q full blocks (finish guard n <= B, 0xf75c). At 44.1 kHz c84 = 0 (in-block == out-block, 0xeaa4).
  Each full block in StemsProImpl::process writes outBlk = B frames to the FIFO (write idx += B, 0xeacc/0xec78/0xec84). The first block drops L (0xee38).
  finishProcessing (0xf190): pad = B - n (0xf224); pad block cleared (0xf274); remainder copied to its start (0xf968-0xf9d4, len n); process (0xf344).
    if L <= pad: FIFO += c84 + n + L (0xf7bc-0xf7c4 count; copy; write idx 0xf730)
    else:        FIFO += B (0xf3f8 copy len outBlk, 0xf4d8); clear, process a second zero block (0xf52c/0xf5b4); FIFO += c84 + n + (L - B) (0xf4dc-0xf504, 0xf730)
    if L was never dropped (T < B): drop L now (0xfa08-0xfb68).
  flushBuffer (0xfdc8) emits min(host block, FIFO fill) until 0 (0xfe20-0xfe28; main loop 0x6184).
  => Host-visible frames = q*B - L + n + L = T for all T >= 0 (checked T = 0..24 for B=8, L=3 and 10 boundary cases at B=131072, L=3072). Output sample i corresponds to input sample i (delay L removed). Consistent with historical records 132300/529200/1323000 frames.
  Tail content: the last n output frames come from a zero-padded block (future samples are zeros).

## 7. FFT backend [P wrapper; H-strong backend semantics]
pffft (create 0x2da28 via table 0x18800150). Forward: copy, zero-pad, rectangle window, pffft_transform_ordered (0x325c0 -> internal ordered=1).
Ordered REAL layout assumed [r0, r(N/2), r1, i1, ...] (upstream pffft convention "F(0)+i*F(N/2) in first entry"; consistent with the setFFTResult/copyFFTResult fix-ups). Upstream pffft is unscaled both ways; no scale constant found in pffft_transform_internal (0x31ce8-0x324e0; only the internal sqrt(1/2) in pffft_real_finalize 0x30384). pffft_zreorder forward loop (0x31630-0x31664) matches upstream structure: reads vin[8k],vin[8k+1] into interleaved out[2k..] and vin[8k+4..] into out[N/2+..]. The canonical meaning of that layout still rests on upstream pffft documentation (no local source), so it stays H-strong, as does unscaled forward/backward.

## 8. Remaining uncertainties
U1 [H-strong] pffft ordered layout/unscaled semantics (no local source; decode 0x315f0-0x31840 or compare with upstream pffft).
U2 CLOSED (round 5): host frames = T; see section 6.
N1 CLOSED (round 5): synthesis Nyquist = 0 (prepare memset 0x13ff4/0x14004; never written afterwards by referencing code).
U6 resampler path (fs != 44100): out of scope.
U7 bit-exact frecpe emulation: out of scope for the static map.
[B] stem identity of s=0..3: parent is stripped; label sites have no channel index (section 9).
[B] runtime equivalence: needs a session-gated original run plus PCM comparison and listening.

## 9. Stem identity (round 6) [B]
Parent Engine (reverse/Engine, AArch64 PIE, no .symtab, 4131 dynsyms) is stripped. Evidence found (20-engine-xrefs.txt, 21-engine-stemrender.txt):
- Protocol client region: "stems-processor" 0xc285f0; params written 0xc2a76c-0xc2a964 (numChannels, sampleRate, maxBlockSize, highQuality, residual, numThreads, session); returnFrames 0xc2a3e0; numReturnChannels check 0xc2adf0; output via ffmpegFileWriter ("Can't create ffmpegFileWriter" 0xc29030) to a .stems file.
- Labels: "StemsLevel/Vocal,Bass,Melody,Drums" at 0xcdcfd8/0xcdd040/0xcdd0a8/0xcdd110 and "Vocal,Bass,Melody,Drums" at 0xdf5f10.. are string-keyed std::map/QML registrations (Rb_tree calls 0x158c1a0/0x158bb60). No processor channel index is attached at those sites.
- Label ORDER (Vocal, Bass, Melody, Drums) is NOT evidence of channel order.
Missing evidence: the .stems playback/decoder routine that maps file channel pairs (0,1)(2,3)(4,5)(6,7) to Engine stem enum values, or a native capture. Not recoverable in this bounded pass without broad parent decompilation.
