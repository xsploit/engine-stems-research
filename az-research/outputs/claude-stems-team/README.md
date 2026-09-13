> **2026-09-13 update:** Original Engine Desktop worker now ran successfully on this PC. Raw paired audio matches the prototype closely on one 30-second 44.1 kHz stereo input; independent numerical screening passed, listening remains pending. The old no-reference/Pi-session blocker below is superseded for the Windows worker. See [desktop validation](../engine-desktop-validation/README.md).

# Latest status: integration pass finished, follow-up paused

Opus5 completed the host-side launch/protocol/lifetime investigation. Codex inspected the saved exec call argument excerpt; the actual execve path is distinct from the refcount helper previously suspected. No worker remains running. 18% Codex remaining at the final check.

- [Integration handoff](INTEGRATION-HANDOFF.md)
- [Evidence and limits](ENGINE-STEMS-INTEGRATION.md)
- [Stems DSP specification](PIPELINE-SPEC.md)
- [PC prototype and measurements](../engine-pc-prototype/README.md)

Still unresolved: semantic stem index names, abort-to-file/status cleanup, exact sidecar encoding parameters and original Engine audio equivalence. No .stems/.mp4 file was found by the bounded current engine-pi research-folder inventory. A larger parent survey remains possible; a read-only local metadata inspection is already within user authorization if a suitable sample becomes available. Do not treat Claude's blanket 'requires authorization' wording as a rule for those reversible read-only tasks. Pi access and original-run capture were not performed here.

No BiteDJ production changes, new PRs, original worker runs or additional benchmarks occurred during this integration pass. Earlier checkpoints below are historical; latest consolidated docs supersede their corrected claims.

## Integration batch 9 reviewed

[Consolidated integration handoff](INTEGRATION-HANDOFF.md): the traced shutdown sends action=done, reads final reply/frame counts and then waits for the child with blocking waitpid and EINTR handling. Codex spot-checked options=0 and retry instructions. Earlier claims of abandonment or signal-free leakage are not supported; timeout/hang behavior remains unverified. One short launcher-argument closure is assigned, then this scoped integration pass will stop at its documented unresolved questions. 18% Codex remaining.

## Integration batch 8 reviewed

[Lifetime findings](engine-integration-round-008.md) identify the actual vfork-based launcher and PID storage. The earlier supposed spawn helper was a filesystem-path constructor. Codex inspected the PID-result store and live-child teardown branch. The traced render setup replaces a processor instance, supporting fresh-worker creation on that path, not global absence of pooling. Next: live-child shutdown behavior and concise corrected integration handoff. 18% Codex remaining.

## Integration batch 7 reviewed

[Updated integration notes](engine-integration-round-007.md) resolve the Qt-property thread-count path and processor-object IO/close routines. Previous fork/exec and no-pool claims were downgraded; exact codec parameters remain unverified. Codex inspected the cited waitpid call, which uses WNOHANG, so it is a poll/check path rather than proof that every call reaps a child. Result model metadata lists only claude-opus-5 this batch. Next: actual launch helper and render lifetime; no repeat of exhausted label-order routing searches. 19% Codex remaining.

## Integration batch 6 reviewed

[New integration notes](engine-integration-round-006.md) cover pre-rendered sidecar selection, queue/status/cancellation interfaces and thread configuration. Codex spot-checked the default-one and positive-thread-count branch instructions. Some notes overstate string evidence: exact AAC encoder/container parameters and one-process-per-track/no-pooling remain hypotheses pending full call-lifetime evidence. No BiteDJ design choice is approved by these findings. Output names still unresolved.

Result metadata includes both claude-opus-5 and claude-opus-4-8, despite launching with opus5. Do not attribute the batch exclusively to Opus5 or accept its unrequested commit-attribution statement. Next batch is explicitly requested on opus5 with model discrepancy to be reported. No commits/PRs created. 19% Codex remaining.

# Research resumed: Engine stems integration

Opus5 is investigating semantic channel routing, .stems loading and generation/cache/worker lifecycle. Five-minute supervision is active again, retaining the10% Codex reserve. This extends the earlier static DSP phase; it does not imply original audio equivalence or a complete Engine runtime map. Previous checkpoints below remain historical.

# Engine stems pipeline — static handoff

Status: static investigation finished for this pass; supervision PAUSED. Opus5 worker is no longer running. Codex usage checked at22% remaining. No Pi access, original worker/model execution, audio render, production edit or new PR occurred.

- [Consolidated pipeline specification](PIPELINE-SPEC.md)
- [Handoff and proposed next capture tests](HANDOFF.md)
- [Graph findings](graph-findings.md)
- [PFFFT source corroboration and limits](PFFFT-SOURCE-NOTE.md)

The inspected44.1kHz path now has a static specification for windowing, magnitude/phase, tensor layout, model/postprocessing, reconstruction, streaming/start/end handling, mono/residual handling and exact output length. The suspected unwritten synthesis Nyquist bin was disproved by traced initialization. Historical intermediate reports retain their correction history; the consolidated specification supersedes them.

Remaining: semantic stem-index mapping was not established by the bounded parent inspection; labels alone do not prove order. FFT semantics are source-corroborated, not proven for an exact source/binary revision. Non44.1kHz resampling and instruction-exact numerical emulation are not specified. Runtime and audio equivalence remain unverified. Ordinary IEEE division can differ from the NEON reciprocal-refinement path; this is not evidence of audible degradation.

The next proposed tests are recorded, not run. They require accessible original processor/Engine output; historical private session material was known only on the powered-down Pi. No Pi retrieval or execution is authorized by this automation. Do not automatically restart the same static searches or treat stripped parent symbols as proof that no other static route exists.

## Earlier checkpoints

## Supervised batch 4 completed

Exact 44.1 kHz trimming was decoded and checked with integer boundary examples: host output frame count equals input frame count. The earlier possible Nyquist defect was disproved: prepare clears both halves of the full 2049-bin synthesis buffer; the unwritten model bin remains zero on the traced path. Codex checked the memset call sites. [Corrected specification](pipeline-spec-round-004.md).

[PFFFT source documentation](https://android.googlesource.com/platform/external/pffft/+/b359f7a1addddda364605af39b8624b1187a8151/pffft.h) corroborates the packing and scaling conventions. Exact compiled-library identity is not established. One bounded read-only Engine-parent inspection is now assigned for the missing semantic stem names. Codex has22% remaining; dynamic/audio validation still pending.

## Supervised batch 3 completed

Opus consolidated [the static specification](pipeline-spec-round-003.md), confirmed initial Hopping/history clears and mono routing, and traced the latency-discard copy to scratch. Codex checked the cited allocation, Hopping clear and FFT packing instructions. Two important details remain unresolved: exact final trimming and initialization of the synthesis Nyquist slot. The latter is a hypothesis, not a demonstrated uninitialized-memory defect. One focused closure batch is assigned; no runtime/audio equivalence claimed. 23% Codex remains.

## Supervised batch 2 completed

Recovered streaming cadence: 131072 new samples per model call with 3072 samples of retained window history; algorithm delay 3072 samples is discarded by the wrapper. Reconstruction uses dynamic overlap-add normalization by shifted window squares. Opus traced default pffft selection, inverse scale and mixture-phase handling. Codex spot-checked Hopping field stores, OLA normalization shift and actual NEON reciprocal instructions. Approximate synthetic reciprocal-error statistics are illustrative, not measurements of the original kernel. Full report: [batch 2 details](pipeline-details-round-002.md).

Batch 3 is closing remaining 44.1 kHz static-spec gaps, especially exact end trimming and zero initialization, before consolidation. Codex has 23% remaining. No audio equivalence established.

## Supervised batch 1 completed

Opus recovered channel-planar magnitude input, separate retained phase, stem-major stereo output, mask multiplication and a candidate explicit Ephraim-Malah formula. He traced residual output to input minus summed stems. Codex spot-checked the Hann-generator arithmetic and discarded highQuality return value; neither is inferred merely from names. Hann uses (n+1)/(N+1), so the earlier NumPy symmetric Hann proxy is not exact. All broader formulas remain static findings pending validation. Full batch: [pipeline details](pipeline-details-round-001.md).

Batch 2 assigned: streaming cadence/start/end padding, overlap-add normalization, backend scaling, phase/bin and mono handling. Codex usage checked at 24% remaining, above the 10% reserve. No dynamic/audio equivalence established.

# Continuation enabled

Opus 5 resumed in tmux `engine-stems-team-x`. Automation `engine-stems-opus-follow-up` checks every 5 minutes, reviews new completed batches and sends focused follow-ups. Codex exits quickly if Opus is still running; no continuous polling. Supervisor preserves a 10% Codex usage reserve and pauses on completion, auth/usage blockers, required user/device input or two rounds without substantive progress. Current state: `../../work/claude-stems-team/worker-status.json`. Historical checkpoints below describe completed earlier batches.

# Latest executed checkpoint — 2026-09-13

Claude Opus 5 completed the processor audit (15 tool calls); Codex executed the ONNX graph audit and cross-checked cited constructor/setup/call-site excerpts. Both are finished; no unattended investigation remains running.

## Main findings

- Processor constructor/configuration and setup call sites support internal 44100 Hz, FFT length 4096, Hann window length 4096, and hopping/overlap-add stride 1024. Constructor frame-count field 128 multiplied by hop gives a 131072-sample block sizing value; this is not a complete latency or padding specification.
- Graph dataflow: normalize the last 2048-wide axis, project 2048→256, convolutional network, project 256→2048, sigmoid. No raw-audio reconstruction exists inside the graph.
- Processor call chain includes magnitude/phase computation before inference and `ephraimMalahApprox` before inverse FFT and overlap-add. The name and observed arithmetic identify a post-processing stage, not a fully recovered mathematical specification.
- Processor checks a channels-last-shaped vector {1,128,2048,2}; ONNX declares {1,2,128,2048}. Dispatcher layout conversion is the next concrete question, not a contradiction to paper over.
- The dispatcher prediction path calls an OrtApi function-pointer slot at offset 0x48, consistent with Run in the existing ORT header. Original worker capture still has not been executed here.

## Read the evidence

- [Graph findings](graph-findings.md), [machine-readable inventory](graph-audit.json)
- [Opus processor audit](opus5-binary-audit.md)
- [Detailed processor evidence table](binary-evidence.md)
- Local disassembly remains in ../../work/claude-stems-team/audit/. No model weights or private session material are in these reports.

## Exact limits and next step

This is a static map, not a working replica or quality approval. Still unresolved: buffer/tensor layout conversion, stereo and stem ordering, exact Nyquist/DC handling, symmetric versus periodic Hann and reconstruction scaling, boundary padding/overlap, external normalization, the full post-processing formula and quality/residual mode branches. Trace the dispatcher layout conversion and magnitude-buffer-to-tensor writes next; do not launch another speed benchmark to answer those questions.

The original worker and model were not modified or executed. No Pi access, production edits, new PR, inference benchmark or audio-quality claim. Prior handoff below records the earlier unknowns; the findings above supersede those that this audit resolved.

---

# Engine DJ exact stems pipeline handoff — 2026-09-13

User requested Claude collaboration on the exact pipeline, reusing existing research.

## Owners located and contacted

- Locate processor model: 01a08f80-4930-7151-b23d-82bd3624af10. Confirmed no complete exact frontend/reconstruction map and no other subagent in that task.
- Live AZ Mixer Controls: 01a08b56-4acd-79a3-baaf-8775a1de5bc8. Confirmed the model task owned this work and found no newer exact-pipeline handoff. Continues AZ independently.

## Source documents

Model task root: /home/subsect/Documents/Codex/2026-09-11/engine-pi-stems-static-processor-model

- outputs/precision/capture-status.md: actual ORT interception hook validated under QEMU with synthetic input, not the original Engine frontend.
- outputs/precision/QUALITY-GATE.md: no approved audio-quality candidate; comparer and required paired-audio/listening checks.
- outputs/inspection-report.md: model graph and tensor microbenchmarks.
- work/arm-emulation/capture-ort.c: capture hook.
- outputs/claude-opus5-review.md and outputs/claude-opus5-capture-followup.md: historical advice, not executed pipeline verification.

Original processor research root: /home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/engine-pi

- STEMS-ASSESSMENT.md: original processor/protocol and previous native test evidence.
- stems-static/probe-render.py: numChannels=2, sampleRate=44100, maxBlockSize=512, highQuality=0, residual=0. These are supplied client parameters; they do not prove internal transform settings.
- stems-static/NATIVE-INSTALL-ORDER.md: install/launch integration, not neural DSP reconstruction.

## Verified boundary and unresolved questions

The model accepts FP32 [1,2,128,2048] and returns [1,8,128,2048]. The final sigmoid is consistent with masks, but does not prove mask application, channel mapping or tensor-axis meaning. Exact spectral window, hop, scaling, normalization, chunk overlap and inverse reconstruction remain unknown. A provisional Hann4096/hop1024 frontend in earlier experiments is NOT verified Engine behaviour.

The synthetic capture hook saved 524288 elements byte-identically. Original Engine capture was blocked on private session material last known only on the Pi. Do not connect to or wake the Pi. No original/candidate rendered-audio pair was saved by that task. A shared approximate pipeline can still screen obvious degradation, but cannot establish equivalence to Engine.

## Claude collaboration

Dedicated tmux session: engine-stems-team-x. Review packet and launch/result files: ../../work/claude-stems-team/. Bounded supplied-evidence review; no command tools, Pi access, production edits, private model upload, or benchmarks. One proposed next experiment and questions for Codex are requested so a subsequent turn can challenge the proposal.

Fable 5 returned HTTP429 requiring usage credits, with zero inference tokens. Opus fallback completed successfully; returned model ID claude-opus-5. Review saved in opus5-review.md. Codex challenged unsupported axis/FFT/order inferences and sent a follow-up explicitly to claude-opus-5. No credits purchased. No pipeline experiments executed in this handoff turn.


## Completed two-way review

Opus 5 completed both rounds (model ID confirmed in both results). See opus5-review.md and opus5-followup.md. It withdrew its parameter-count inference and claims that synthetic probes could settle ordering or FFT semantics. Agreed proposed next step: a bounded static graph/metadata audit, then use processor call sites to resolve specific remaining questions. No audit or benchmark was launched here.

Codex caveat on follow-up: absence of an input-to-output Mul does not prove external masking occurs; presence of Mul alone does not prove mask semantics. In-graph normalization may coexist with external normalization. The entire dataflow and processor usage must support either claim. These remain hypotheses until verified.
