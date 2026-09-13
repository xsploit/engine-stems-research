# Engine stems pipeline: static binary details (round 2)
Sources: stems-processor sha256 3c6f1cb7..., libNNPredictionDispatcher_on.so sha256 3ffdda6e... Static disassembly only (fn-*.txt, 10-,11-,13-).
Tags: [PROVEN] = decoded dataflow at the cited addresses; [SYMBOL] = name only; [HYP] = unverified.

## 1. Input tensor semantics
- [PROVEN] Dispatcher ONNXImpl::init (0x439ad4 input, 0x439f68 output) calls convertPosToChannelsLast. Decoded at 0x437650: dst[0]=src[0]; dst[i-1]=src[i] for i=2..n-1; dst[n-1]=src[1]. ONNX [1,2,128,2048] is reported to the processor as {1,128,2048,2}, which matches prepare's expected shape.
- [PROVEN] convertPosToChannelsFirst (0x4372f0) is the inverse permutation.
- [PROVEN] setRawData (0x4367c0) only checks count==numElements (+0x60) and adopts the pointer (it frees owned storage). It does NOT rearrange. It is called at 0x153f8 with ptr=this+0x568 and count=m78*m50*m58=2*128*2048.
- [PROVEN] this+0x568 is the contiguous storage of the magnitude AudioBlock (object at this+0x528, channel pointer array +0x540, offset +0x558). The prepare loop at 0x14548 sets chanPtr[ch]=data+ch*len*4, so storage is channel-planar.
- [PROVEN] computeInputTensor (0x15128), stereo path. Outer loop f=0..127 (shape[1]). The input view is offset by f*hop (0x154b0: offset=f*m60). Hopping::process (0x15228) is followed, per channel c<shape[3]=2, by multiply(frame[c], window this+0x90/0x98) (0x15264). Then Fft::transform (0x152fc); per channel, calculateMagnitude -> magBlock[c][f*2048 + off] length 2048 (0x15344), and calculatePhase -> phaseBlock(this+0x5a0)[c][f*2048] (0x15390). Complex source view offset 0 is used, so bins start at index 0.
- [PROVEN] Tensor memory = mag[c][f][k] with index c*128*2048 + f*2048 + k, i.e. ONNX axis1=audio channel, axis2=STFT frame (hop steps), axis3=FFT bin k=0..2047. Phase is NOT given to the model; it is stored for resynthesis.
- [PROVEN] Mono input (numChannels==1, branch 0x154e0) processes channel 0 only, then copies mag ch0 -> ch1 (0x15790, len 128*2048).
- [PROVEN] If flag m80 (params byte +0x14) is set and the input has channels, then shiftLeftAndInsert(histBlock this+0x780 [c], input[c]) (0x15468).
- [HYP] Whether bin 2048 (Nyquist) is dropped by dst-length truncation depends on calculateMagnitude honouring dst length (0x246f8), and on FFT bin count. See section 4.
- Graph (Codex): BN over the 2048 axis, then melW 2048->256 on the LAST axis. This is consistent with axis3 = frequency.

## Correction to BINARY-EVIDENCE.md
- m70 = params u64 @+0x08 is the audio CHANNEL COUNT C, not maxBlockSize. computeOutputTensor loops ch<m70 with a m70==1 special case (0x15850), and uses the channel index s*m70+c. m68=4 is the stem count S. Chunk block = m50*m60 = 128*1024 (unchanged).

## 2. Output tensor, mask application, EM post-filter, phase, resynthesis
VectorOps calling convention [PROVEN]: x0=dst view, x1=src view, in-place (e.g. divide 0x24130 tail-calls the zplf *_I kernel with dst,src). The NEON kernel arithmetic itself was not disassembled.
- [PROVEN] 0x157e8-0x1584c: the output tensor data (channels-first [1,8,128,2048], from dispatcher internal dims) is memmoved into outBlock (this+0x708, ptrs +0x720). outBlock channel index used everywhere = s*C + c. So ONNX axis1 j = s*2 + c (stem-major, channel-minor) under the processor's interpretation.
- [PROVEN] Mask application 0x15890-0x158e0: for s<4, c<C: out[s*C+c][0..128*2048) *= mag[c][same]. So S_est = sigmoid_out * |X_c| elementwise (TF bin).
- [PROVEN] For each frame f<128, each s, each c: ephraimMalahApprox(s, c, f) (call 0x15980; x1=s, x2=c, x3=f). It modifies out[s*C+c] frame f IN PLACE (final multiply dst at 0x12e20).
  Decoded formula (buffers A=this+0x960, B=+0x8e8, Cb=+0x9d8, G=+0xa50 per-channel scratch; eps = this+0xacc = 0x34000000 = 1.1920929e-07, set in prepare 0x1432c/0x14338):
      S = out[s,c,f,k]; X = mag[c,f,k]
      xi    = S^2 / ((X - S)^2 + eps)                  (0x12970-0x12b48)
      gamma = X^2 / ((X - S)^2 + eps)                  (0x12ab8-0x12b8c)
      w     = xi / (1 + xi)                            (0x12bd0-0x12c3c)
      v     = gamma * w                                (0x12c80)
      gain  = sqrt(v^2 + 0.7212*v) / (gamma + eps)     (0x12cc4-0x12de4; 0.7212 = f32 0x3f38a090 @0x12ccc)
      out[s,c,f,k] = S * gain                          (0x12e3c)
  Noise estimate = (X - S)^2, i.e. the complement of the stem within the same channel mixture.
- [PROVEN] 0x15a00 setMagnitudeAndPhase(dst=complex block this+0x690 [s*C+c], mag=out[s*C+c] frame f (len 2048), phase=phaseBlock(this+0x5a0)[c] frame f). The retained phase is the MIXTURE phase of input channel c. No phase estimation.
- [PROVEN] 0x15a90 Fft::transformInverse(complex block 0x690 -> time block 0x618), then 0x15b04 OverlapAddStep::process(this+0x2c8) into the output view. Output offset advances f*m60 when m60!=0 (0x15d94). The OLA channel count is S*C (x5 = m68*m70, 0x15abc).
- [PROVEN] First-call flag this+0xac8 (set to 1 in prepare 0x14330). On first output, fill(0.0) for (S + m80)*C channels over length ([this+0x2a8]-[this+0x2b0]) at the output start (0x15b28-0x15bb0), then the flag is cleared. [HYP] this is the startup latency region; length meaning is in section 5.
- [PROVEN] Residual when flag m80 (params byte +0x14) != 0 (0x15bb4-0x15d04), per channel c:
      R = sum_s outStem[s*C+c]                     (add, 0x15c40)
      R = R - hist[c]   (hist = this+0x780 block filled by shiftLeftAndInsert of INPUT audio, 0x15468)   (0x15c8c)
      R = R * -1.0                                  (0x15cb0)  => R = hist[c] - sum_s stems
      output channel (4*C + c) = R                  (copy 0x15d04)
  Otherwise the scratch at this+0x7f8 is cleared (0x15d4c). So m80 = residual-output enable, and total output channels = (S + m80)*C.

## 3. Stem/channel ordering and highQuality/residual parsing
- [PROVEN] main 0x5744-0x5830: readParamBlock, then fromParamBlock: numChannels(int)->w23, sampleRate(float)->s8, maxBlockSize(int)->w21, highQuality(bool) at 0x57d8, residual(bool)->w26, numThreads(int)->w28.
- [PROVEN] The highQuality result is DISCARDED: w0 is overwritten at 0x57dc and never saved. highQuality has no effect in this processor build.
- [PROVEN] 0x5a80 StemsPro::initialize(numChannels=w23, sampleRate=s8, maxBlockSize=w21, numThreads=w28, residual=w26).
- [PROVEN] StemsProImpl ctor builds PrepareParameters at 0xe384-0xe3ac: {f32 sampleRate @0, u64 numChannels @8, i32 numThreads @0x10, bool residual @0x14} -> prepare. Hence m44=host rate, m70=C, m80=residual.
- [PROVEN] getInstrumentOutputChannels(i) (0x127d0) returns the first output channel: i=0->0, 1->C, 2->2C, 3->3C, other->4C (the residual slot). getNumOutputChannels = (4+residual)*C (0x12810).
- [PROVEN] Output channel layout = [stem0 L,R][stem1 L,R][stem2 L,R][stem3 L,R][residual L,R if enabled] for C=2. This matches ONNX axis1 j = 2s+c.
- [BLOCKED statically] Stem identity (which of 0..3 is vocals/drums/bass/other): there are no instrument name strings in the processor. The Instrument enum names are not in the symbols. The mapping lives in the Engine parent or in docs.

## 4. FFT packing, window, scaling, OLA
- [PROVEN] Analysis window: WindowGenerator::hann (0x1ec80), length N=4096, float32:
      w[n] = 0.5 * (1 - cos(2*pi*(n+1)/(N+1))), n=0..N-1     (2*pi = f32 0x40c90fdb; divisor N+1)
  This is "symmetric Hann without the zero endpoints" (neither periodic nor classic symmetric). Applied by explicit multiply in computeInputTensor (0x15264). The FFT object's own window is WindowGenerator::rectangle (Fft PrepareParameters window ptr = GOT 0x187fff40 -> 0x1ec18).
- [PROVEN] Fft::getNumFftBins (0x1c618): N even -> N/2+1 = 2049. transform checks output spectrum length == 2049 (0x1cf9c). The model tensor takes the magnitude of bins 0..2047 only (calculateMagnitude count = view length 2048, offset 0; 0x246f8 loops to the view length). DC is kept and the Nyquist bin 2048 is dropped from the model input.
- [PROVEN] Magnitude = sqrt(re^2+im^2) float32 (0x24740-0x24750). Phase = atan2f (0x24800); the argument order was not checked.
- [PROVEN] Forward: backend zplfFFT (virtual) then setFFTResult deinterleaves re[k]=buf[2k], im[k]=buf[2k+1] (ld2 at 0x25190). The pffft wrapper (0x2d5a8) copies, zero-pads, and calls pffft_transform_ordered with no scaling.
- [PROVEN] Inverse (0x1d84c-0x1d8a4): copyFFTResult (interleave), multiply by 1/(N_backend) * 1/p where p = Fft::Impl float +0x8, then backend zplfIFFT. p defaults to 1.0 (0x1e71c). Mode ==1 (Impl reads params +0x18) gives p = 2/sum(window) (0x1ea20). Another branch gives p = 2/sqrt(...) (0x1e9e0).
- [HYP, strong] StemsProAlgorithm passes mode field +0x18 = 0 (0x1363c `str wzr,[sp,#0x168]`), so p=1.0 and inverse scale = 1/4096. That is a unity round trip for unnormalized pffft. Still unverified: the branch after 0x1e720 for mode 0, and which backend (pffft vs generic rdft, whose zplfIFFT has an extra *2.0 at 0x25644) is selected via GOT 0x187fffb8 -> data 0x18800150.
- [PROVEN] Synthesis: OverlapAddStep window = WindowGenerator::hann (OLA PrepareParameters window ptr GOT 0x187ffe30 -> 0x1ec80). OverlapAddStep::process per channel (0x19308-0x19468): frame *= window(+0x150) (0x1937c); acc += frame (0x193c4); out_hop = acc[0..hop) (copy 0x1940c); out_hop /= norm(+0x110) (divide 0x19440); acc shiftLeftAndClear(hop) (0x19468).
- [HYP] norm(+0x110) = sum over hop shifts of w_analysis*w_synthesis (built in OverlapAddStep::prepare after multiply 0x17adc). Next: 0x17ae0-0x18560.

## 5. Latency, padding, chunking
- [PROVEN] Chunk = 128 frames, hop 1024. computeInputTensor frame f reads the input view at offset f*1024 (0x154b0), so one model call covers 127*1024+4096 = 134144 samples of analysis input.
- [PROVEN] Output: per call, 128 ISTFT frames are overlap-added at output offset f*hop (0x15d94).
- [PROVEN] First call only: output zero-filled for L = [this+0x2a8]-[this+0x2b0] samples across all output channels (0x15b28-0x15bb0).
- [PROVEN] getLatencyInSamples (0x114c0) = L, or round(L * m44/m40 + 0.5) when resampling flag +0xa8 is set.
- [PROVEN] getResamplerCompensationSamples (0x12840) = prefill(in resampler +0x1a0) + prefill(out resampler +0x1e8) * (m44/m40), and 0 when not resampling.
- [PROVEN] The input resampler is 44100-bound and active only if hostRate != 44100 (0x13664). With sampleRate 44100 (Engine probe) no resampling happens.
- [UNRESOLVED] Value of L and where 0x2a8/0x2b0 are written. There are no direct stores in prepare/Hopping (grep). Likely Hopping or StemsProImpl ring-buffer fields.
- [UNRESOLVED] Whether consecutive model calls overlap (a rolling 128-frame window advanced by fewer than 128 hops) or tile. That is decided in StemsProAlgorithm::process (0x16290) / Hopping::process (0x187c0) / StemsProImpl::process (0xea00), and in the input block size (getInputBlockSize 0x12750).
