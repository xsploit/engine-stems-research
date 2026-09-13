# Engine Desktop reference capture — 2026-09-13

**Original Engine Windows worker successfully rendered on this PC. Our reconstruction closely matches its raw output on the existing 30-second, 44.1 kHz stereo fixture.** This supersedes the previous claim that no original paired audio was available without the Pi.

## What ran

Official Engine DJ Desktop 5.1.0 Windows download, Wine 11.17, isolated prefix under `work/engine-desktop-test/wine-x11`. The 32-bit bundle launcher failed; its embedded x64 MSI installed successfully through Wine msiexec. A separate Xwayland display `:88` and Qt software rendering enabled usable UI. No Windows-drive installation or existing library was changed. Engine initially reported an unsupported mono output device; dismissing that did not prevent offline rendering. Playback through the PC audio device was not tested.

Engine imported a copy of our benchmark input and completed its normal Create stems workflow, downloading its own Windows processor. Desktop rendering requires no license according to the [official FAQ](https://support.enginedj.com/support/solutions/articles/69000862792). Installer provenance: [official downloads](https://enginedj.com/downloads), Windows 5.1.0 release listed September 1, 2026. Its installer build timestamp is a different date and is not the release date.

The generated .stems file contains an eight-channel AAC stream, but ordinary local FFmpeg decoding reports invalid band/channel errors and produced only a partial WAV. That partial file is **not** the reference and must not be used for comparison. This alone does not establish the cause of the packaging/decoder incompatibility. Reported container duration was 29.952993 s, whereas the captured worker returned exactly 30 s; do not mistake container timing for DSP frame loss.

## Original raw reference

A local C pipe proxy temporarily occupied the processor launcher path inside the test prefix, spawning an untouched backup of the original worker. Engine performed its normal session handshake; the proxy forwarded input and duplicated worker stdout before Engine encoded/packaged it. Private protocol capture stays in a mode-700 directory, with mode-600 capture files. No session values, proprietary weights, or binaries are included in this report.

The protocol ended with `done=true`; parsed output is eight float32 channels, 1,323,000 frames, all finite. The original worker was restored and its SHA256 verified after capture. Source: `work/engine-desktop-test/tee-worker.c`; parser: `compare-capture.py` in the same directory. The wrapper adds pipe/capture overhead, so this run is **not a valid original-worker speed benchmark**.

Both imported source WAV and prior prototype input WAV have SHA256 `f197320e561fc7cb5423139bcf0d317e6840dd040d9cf4302af493211b63e29c`.

The Windows worker contains a byte-identical copy of the 410,711,419-byte ARM-extracted ONNX model: SHA256 `c203bfa6bd53d16ef7ba6393540453f6cfd7541a87c169be5310989b8d987a0a`. See [model identity](model-identity.json). Windows source-path strings identify Stems-Pro-Windows 1.1.0. Same model does not prove identical host behavior or every numerical kernel across platforms.

## Comparison

No time alignment, truncation, resampling, gain fitting, or stem permutation was applied. Original and candidate both have 1,323,000 frames, stereo per stem, 44,100 Hz.

| Stem index | Maximum sample error | Error RMS | Signal/error ratio |
|---|---:|---:|---:|
| 0 | 2.51e-8 | 3.59e-9 | 100.26 dB |
| 1 | 3.58e-7 | 2.72e-8 | 133.66 dB |
| 2 | 4.02e-7 | 2.21e-8 | 129.84 dB |
| 3 | 3.93e-7 | 2.41e-8 | 130.97 dB |

[Full measurements](comparison.json). The stereo-pair correlation matrix strongly matches index 0 to 0, 1 to 1, 2 to 2, and 3 to 3. This proves correspondence between these two outputs; it does not attach Vocal/Bass/Melody/Drums names to the indices.

The existing independent `compare-stems.py` decoded both sets of WAVs with FFmpeg and checked every one-second channel window: **PASS_REQUIRES_LISTENING**. Its quality verdict remains NOT_ESTABLISHED. See [quality screen](quality-screen/comparison.json), [pair manifest](pairs.json).

## Listening material

These are automatically selected comparison excerpts, not a listening verdict. Each row is reference / reconstruction / difference:

- Stem 0: [original](quality-screen/00-reference.wav), [candidate](quality-screen/00-candidate.wav), [difference](quality-screen/00-difference.wav).
- Stem 1: [original](quality-screen/01-reference.wav), [candidate](quality-screen/01-candidate.wav), [difference](quality-screen/01-difference.wav).
- Stem 2: [original](quality-screen/02-reference.wav), [candidate](quality-screen/02-candidate.wav), [difference](quality-screen/02-difference.wav).
- Stem 3: [original](quality-screen/03-reference.wav), [candidate](quality-screen/03-candidate.wav), [difference](quality-screen/03-difference.wav).

Full original WAVs remain in `work/engine-desktop-test/reference/engine-stem-{0..3}.wav`; full candidate WAVs are in `outputs/engine-pc-prototype/pc-cpu4`.

## Remaining limits

This establishes strong numerical agreement on one stereo 44.1 kHz input with the Windows worker. It does not establish listening quality, ARM bit equivalence, mono/residual output, other sample rates, every tail length, live latency, Pi performance, or hardware UI stem identity. Desktop has no individual-stem audition controls per the official FAQ, so that specific proposed UI-solo test cannot be performed in Desktop.

The complete local firmware tree also contains 13 prepared demo .stems files and their source tracks at `work/engine/runtime64/usr/Engine/Content/DemoDevice`; prior negative searches covered a smaller directory. First demo also triggers ordinary FFmpeg AAC errors. Their exact rendering provenance is unknown.

No Pi access, production BiteDJ changes, new PR, or automation resumption occurred. Research automation remains paused. Next high-value work is listening to paired output, then one deliberately varied boundary/sample-rate fixture if needed, and separately tracing the packaged-file decoder/control mapping.
