Claude Opus 5 review of supplied evidence; recommendations are unverified.

## Scope

I reviewed only the four supplied files plus the owner handoff. I have not opened the model, the JSON inspection files, `work/precision-experiments.py`, `probe-render.py`, the AArch64 binaries, or anything on the Pi. Everything below is inference from this packet.

## 1. Pipeline map: what is evidenced vs. assumed

**Evidenced (from `outputs/inspection-report.md`):**
- One ONNX graph, PyTorch 2.3.1 / opset 11, 489 nodes, 154 Conv, 75 BN, 142 LeakyRelu, no attention; 102,642,696 initializer elements.
- Input `float32[1,2,128,2048]`, output `float32[1,8,128,2048]` — same last two dims, so the network is shape-preserving on axes 2–3.
- Final Sigmoid (owner handoff), i.e. output bounded to (0,1).
- Protocol parameters the original client sends: `numChannels=2, sampleRate=44100, maxBlockSize=512, highQuality=0, residual=0, numThreads` (`probe-render.py`, per handoff).
- Official processor + dispatcher are AArch64; ARM ORT 1.16.3 runs under QEMU on the PC; the `OrtApi.Run` hook in `work/arm-emulation/capture-ort.c` is validated byte-exact on a synthetic harness.

**Unknown — and I think previously over-claimed:**
- **Axis semantics are not established.** `2` may be stereo L/R, real/imag, mag/phase, or mid/side. Which of `128`/`2048` is frequency vs. time is unresolved. The Hann-4096/hop-1024 reading (2048 ≈ 2049−1 bins, 128 frames ≈ 2.97 s @ 44.1 kHz) is attractive but **circular**: those STFT parameters come from `work/precision-experiments.py`, which the handoff says is not Engine-verified. The competing reading — `128` = mel bands (the report cites "mel projection" names), `2048` = frames ≈ 47.5 s — is equally consistent with the packet and has very different reconstruction consequences. `maxBlockSize=512` is a transport block size and says nothing about model chunking.
- **"Masks" is one hypothesis, not a finding.** Sigmoid is equally consistent with normalized magnitude, power-law-compressed magnitude, or a bounded gain in a warped domain. `8 = 4 stems × 2 channels` is plausible but unproven; the stem↔channel index order and stem identity order are unknown, and `residual=0` hints the 4th output may be a computed remainder rather than a predicted stem.
- **Frontend normalization, reconstruction (phase handling, mask application, overlap-add, windowing), and `highQuality` semantics are entirely outside the packet.**

## 2. Strongest overlooked low-cost route (PC only, no Pi)

**Treat the model file as its own specification, then treat the binaries as the oracle.** Two things in the packet are under-used:

**(a) The graph's constants are unread.** 102.6M initializer elements against 154 convs implies at least one very large dense projection. If the "mel projection" is a baked constant, a 2-D nonnegative, banded/triangular initializer of shape `[128, 2048]` (or `[2048, 128]`) *simultaneously* pins which axis is frequency, the linear bin count (hence n_fft), and — by fitting filter peak positions — fmin/fmax/sample rate. Also unread: graph `metadata_props`, `doc_string`, and the literal input/output tensor names. This costs minutes, requires no Pi, no session material, and cannot be blocked.

**(b) The capture hook is already more capable than it is being used.** `capture-ort.c` already dumps outputs (`if(!status && calls==1) ... "output"`), gated only by `STEMS_CAPTURE_INPUT_ONLY`. The same validated LD_PRELOAD technique, pointed at the *file/PCM boundary* of the AArch64 processor under QEMU rather than at ORT, would yield exactly the original rendered stems `QUALITY-GATE.md` says are missing. Two risks: the hook wraps only `OrtApi.Run` — if the worker uses `IoBinding`/`RunWithBinding`/`RunAsync`, it captures silently nothing; and the whole route still depends on the `session-material.private` blocker (see Q1).

## 3. One bounded next experiment

**"Model self-description audit"** — static constant inventory plus three synthetic probe inferences on the existing PC ONNX Runtime session (`outputs/benchmark.py` harness). No Pi, no Engine, no weights published; deliverable is a single report of shapes, names, and summary statistics.

1. Dump: input/output tensor names, `metadata_props`, `doc_string`, and the top-10 initializers by element count with name, shape, and consuming node type.
2. Classify any 2-D initializer with a dim in {128, 2048, 2049} as filterbank-candidate: check nonnegativity, row sparsity, contiguous support, peak-position monotonicity.
3. Probe A: all-zeros input. Probe B: input nonzero only in a narrow slice along axis 3, zero elsewhere. Probe C: one of the two axis-1 channels zeroed. Record per-output-channel means over zero-input regions, and the sum across the 4 candidate stem groups in energetic regions.

**Success:** a filterbank-shaped constant is found (→ axis 3 is frequency, n_fft recoverable), **or** Probe A/B give a clean verdict — outputs pinned near 0 where input is 0 favours direct-magnitude output; outputs floating at arbitrary nonzero values there favours masks; group sums near 1.0 favour ratio masks. Probe C should reveal whether channel index is stem-major or channel-major.

**Stop:** if no filterbank-shaped constant exists *and* Probe A/B are ambiguous (outputs neither near-zero nor structured), stop. Do not fabricate an STFT frontend; escalate to the binary/QEMU route instead. Hard stop regardless: no speed tuning, per `QUALITY-GATE.md`.

## 4. Questions to Codex

1. **What is `session-material.private` materially?** A licence/entitlement artifact, an IPC nonce/handshake token, or a saved protocol transcript? This decides whether PC-only recovery from the supplied dispatcher is legitimate and feasible — if it is a protection/entitlement artifact I would treat reconstructing it as out of scope and say so to the owner.
2. **Was the worker's actual inference call path ever confirmed?** Does the AArch64 processor call `OrtApi.Run`, or `IoBinding`/`RunAsync`? And can the processor executable be driven directly under QEMU-user, bypassing the dispatcher?
3. **What are the literal ONNX input/output tensor names and the largest initializer shapes?** You have them; they may settle §1's axis question before my experiment runs, and would tell me whether any stem ordering was ever recorded in graph metadata.