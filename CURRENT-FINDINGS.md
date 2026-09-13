# Current findings

## Confirmed within the tested scope

- The reconstructed PC pipeline ran against the original Engine DJ Desktop 5.1.0 Windows worker output captured under Wine. The original worker received Engine's normal handshake; this was not a fabricated output comparison.
- Four stereo stems, in output order s0L,s0R,s1L,s1R,s2L,s2R,s3L,s3R. The reconstruction writes stem-0.wav through stem-3.wav.
- Semantic assignment to vocals, drums, bass and melody is still unverified. Matching corresponding indices across implementations does not prove their names.
- Reconstructed output files are stereo float32 WAV, 44.1 kHz, with exact input frame count on the tested fixtures. Latency is already removed; do not shift by another 3072 frames.
- residual.wav is source minus the four reconstructed stems, not a fifth separated musical part. The four-stem sum is not guaranteed identical to the source.
- The Windows worker contains the same ONNX bytes as the extracted ARM worker: 410,711,419 bytes; SHA-256 c203bfa6bd53d16ef7ba6393540453f6cfd7541a87c169be5310989b8d987a0a.
- On the 30-second stereo fixture, maximum sample error against the original worker was approximately 4.02e-7. On the later 80-second Kromestar prefix it was approximately 2.50e-6. No gain fitting, alignment fitting or stem permutation was needed. See the JSON evidence for exact values.
- Independent numerical screening passed. The user listened to a 55–70 second Kromestar A/B excerpt and gave tentative acceptance ("Seems ok to me i guess"). This is limited subjective evidence, not broad listening validation.

## Recovered pipeline

At 44.1 kHz: FFT 4096; hop 1024; 128 model frames per call; 2048 model bins; 131072 input frames per chunk; 3072 history/latency frames. Analysis uses the recovered Hann(n+1)/(N+1) window. Model input is magnitude, shape [1,2,128,2048]; output is [1,8,128,2048]. Output masks and the recovered EM-like magnitude postfilter feed mixture-phase reconstruction. Synthesis uses zero Nyquist, inverse normalization, running window-squared overlap-add, and explicit start/end trimming. Full equations, dataflow and evidence addresses are in PIPELINE-SPEC.md.

The prototype uses NumPy FFT and ordinary division, not the original pffft/NEON implementation. Close agreement on these samples does not establish ARM bit equivalence.

## Performance evidence

One Linux x86-64 i5-13600K run, ONNX Runtime 1.30.0 CPU, four inference threads: 30 seconds of source rendered in 1.884 seconds plus 0.436 seconds model initialization; peak process RSS about 904.1 MiB. Reported total was 2.323 seconds. The renderer benchmark excludes some setup/reporting work. This is an offline PC measurement, not Pi performance or live latency. A full model chunk represents about 2.97 seconds of newly arriving live audio.

Earlier Pi, model-only, graph and precision experiments are included separately. Read each report's environment and test scope before comparing numbers. The original worker capture proxy adds overhead, so its capture run is not a valid worker-speed benchmark.

## Unresolved

- Reliable semantic names for the four indices.
- Broad listening across genres, artifacts and difficult material.
- Full validation of other sample rates, mono/residual paths and all boundary lengths against the original processor.
- Quantization/precision changes validated against complete audio quality, not just tensors.
- Sustained Pi performance of the newly verified complete reconstruction.
- The generated Engine .stems file's packaging/decoder behavior: local ordinary FFmpeg reported errors on the tested eight-channel AAC file. Raw worker output, not that partial decode, was the reference.

No claim is made of a complete Engine clone, native Windows reconstruction, or live stems in a DJ application.
