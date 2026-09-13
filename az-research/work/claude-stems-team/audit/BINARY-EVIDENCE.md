# Static binary evidence: stems-processor 1.4.0 (zplane Stems-Pro LinuxARM 1.1.0)
Read-only llvm-objdump/nm/readelf on originals (sha256 in 00-sha256.txt). No execution, no inference. Symbols present; DWARF name lookup returned nothing.
The labels below come from how values are used in the code. There were no DWARF member names.

## Confirmed
| Fact | Evidence |
|---|---|
| ctor constants: m40=44100.0f, m48=4096, m50=128, m58=2048, m60=1024, m68=4, m78=2 | StemsProAlgorithm() 0x10f10-0x10f4c; rodata 0x33b70/0x33b80; prepare 0x12eb8 rewrites m68=4 |
| FFT size 4096 (m48) | Fft::prepare arg at 0x13628 |
| Hann window, length m48=4096 | WindowGenerator::hann call 0x14324 (len x22=[m48] 0x142d8) |
| Hop 1024 (m60); Hopping & OLA get (m48,m60) | 0x1359c-0x135d8, 0x135e4-0x1361c |
| 128*1024 = 131072-sample chunk (m50*m60) feeds resampler block size | 0x1368c, 0x136e8 |
| Internal rate 44100; input resampler only if host rate != 44100 | fcmp m40 vs params.float@0, 0x1365c-0x136ac |
| Expected input shape vector {1,m50,m58,m78}={1,128,2048,2}; output {1,128,2048,m78*m68=8}; mismatch throws | 0x12fa4-0x12fdc, 0x13250-0x13294, assert strings 0x32b70/0x32c28 |
| Model embedded in processor (Stems_resources) -> ONNXModel/ONNXImpl; warm-up predict in prepare | 0x12ed4-0x12f58, 0x13598 |
| Pre: Hopping -> multiply -> Fft::transform -> calculateMagnitude + calculatePhase -> setRawData; shiftLeftAndInsert (frame buffer) | computeInputTensor 0x15228-0x15468 |
| Post: getData -> multiply -> ephraimMalahApprox (squares/divide/sqrt) -> setMagnitudeAndPhase -> transformInverse -> OverlapAdd -> fill/add/subtract/multiply | computeOutputTensor 0x158e0-0x15cb0 (second copy 0x15e24-0x16234) |
| Inference = OrtApi slot 0x48 (Run), run_options NULL; not RunWithBinding | dispatcher ONNXImpl::predict blr 0x43cf30 (ldr [api,#0x48] 0x43cf28) |
| Dispatcher embeds ORT 1.16.3; OrtGetApiBase via JUMP_SLOT | readelf -r; strings |

## Hypotheses (not confirmed)
- H1: ONNX [1,2,128,2048] = zplane channels-last {1,128,2048,2} transposed by dispatcher. Resolve: getModelInputShapeAtIndex / rearrangeDataVecToChannelsFirst disassembly.
- H2: 128 = frames, 2048 = bins (4096/2, which bin dropped unknown). Resolve: the index loop around setRawData 0x153a0-0x153f8.
- H3: whether axis "2" = stereo magnitudes or magnitude+phase (both are computed). Resolve: which buffers go to setRawData.
- H4: whether the sigmoid output is a mask: the multiply at 0x158e0 (operands unknown) is followed by Ephraim-Malah post-processing, so raw output is NOT applied directly as-is. Resolve: operands of 0x158e0 and ephraimMalahApprox arguments.
- H5: which phase is used for resynthesis (mixture phase likely). Resolve: setMagnitudeAndPhase args 0x15a00.
- H6: add/subtract after OLA = residual stem. Flag byte params+0x14 -> m80 controls a 2nd resampler sized (m68+1)*maxBlock. Is that flag residual or highQuality? Resolve: main's param parsing -> StemsPro::initialize(int,float,int,int,bool), which has only ONE bool.
- H7: capture-ort.c can interpose: it needs the ORT_API_VERSION to match 1.16.3 headers and JUMP_SLOT resolution to the preload. Not run-verified.

## Blockers
- Session challenge/response gates real rendering; no inference was executed, by instruction.
