# Engine stems: current Pi evidence

Read-only inspection of the System One5.0.4 runtime on the Pi, with EMain159449
remaining alive and the physical backlight0. No renderer download or playback
change was performed during this inspection.

Official Engine5.0 release notes state System One supports on-device stem
rendering: https://support.enginedj.com/support/solutions/articles/69000878658-engine-dj-5-0-release-notes
This establishes the product feature, not successful transplantation to Pi.

The extracted runtime includes13 `.stems` demo files under
`/usr/Engine/Content/DemoDevice/Engine Library/Stems`.
A read-only ffprobe of the file beginning `1 f3e19cd6-...` identifies MP4 with
one eight-channel AAC audio stream,44100Hz,79.319002seconds. ffprobe also emitted
`channel element 2.11 is not allocated`. Four stereo parts are consistent with
that channel count, but this does not establish ordinary ffmpeg decoding,
channel ordering or successful native playback. No demo audio is published.

The running executable `/usr/Engine/Engine` includes references to:
- EmbeddedStemsProcessorDownloadManager
- stems-child-process.sqsh.signed
- stems-processor.tar.zst
- isStemsProcessorAvailable / hasStemsProcessorFactoryInstalled
- hasStemsProEmbeddedRendering
- hasDemoContentPreRenderedStems
- zplaneStemsRenderThreadCount

No files named stems-child-process*, stems-processor*, *.rknn or *.onnx were
found in the extracted runtime tree. This is a filename inventory, not proof
that no embedded models/code exist anywhere. The earlier session's optional
stem-download prompt was dismissed (see STATUS.md). Static names do not prove
renderer hardware requirements, performance, installation or licensing state.

Next meaningful checks:
1. Determine whether native DemoDevice can be selected and its pre-rendered
   stems played/muted independently through the existing Engine lab controls.
2. Inspect the normal processor-download flow and its actual requirements before
   attempting generation. Do not infer generation works from demo playback.
3. If generation becomes available, test one bounded track with measured time,
   memory and playback responsiveness; Pi4GB is not equivalent to target hardware.

For BiteDJ, prepared-stem file compatibility and separation algorithms remain
separate from the completed regular Engine library reader. Do not describe
current Engine import work as stem import or native stem generation support.

## Native UI inspection

The live Engine159449 session exposes Demo Tracks through Source→expanded
Source menu→Demo Tracks. Selecting it populates native titles/artwork, including
Scratch Sentence, Keep On Running and Higher. Selecting the native Stems list
shows the prepared demo tracks with stem badges. No processor download was
needed merely to access this prepared library. Both original decks remained
loaded (Emalkay and Kromestar) throughout this inspection; no playback command
was sent. Returned toward waveform view at the end; backlight confirmed0.
Evidence: stems-fullsource.png, stems-demo-ready.png, stems-filter.png.

Capture detail: the current session uses request-native-frame.py and native
RGBA readback, not live-capture.py's historical outputNNN.png files. The live
EGL surface is1200×1920 (confirmed runtime log); rawGL data needs vertical flip
then90degree counterclockwise rotation for the logical1920×1200 layout.
The earlier stale file copied after legacy capture failure is explicitly named
stems-stale-old-capture-not-current.png and is not current-session evidence.

Prepared stems are browsable; isolated-part audio playback/muting remains
unverified. Next test must load a demo into a deck and verify native stem
controls plus actual output while preserving/restoring the regular test tracks.

## Prepared demo playback probe — 2026-09-11

Loaded Keep On Running (Tenei) from native Demo Tracks/Stems into deck 1 using
native BrowseEncoder note 0x00 on channel4. Deck2 retained Kromestar. Native
waveform/title/stem badge loaded successfully. Playback note0x01 produced
nonzero mapped S24_3LE master-channel output; cue note0x02 returned output to
zero. Runtime PID159449 remained alive; backlight remained0 at test start.

40-buffer RMS measurements (master L,R; cue channels both zero):
- baseline paused: 0,0
- full_mix: 296514.25,295400.75
- acapella_requested (0x27): 151396.59,150788.04
- instrumental_requested (0x28): 253654.40,254270.46
- cue_stopped: 0,0

Each playing probe saw40 distinct buffers; paused probe1. The three playing
windows cover different song positions, so their RMS differences DO NOT prove
part isolation. Next gate is identical-position repeat/control-state evidence
or all-parts-muted output, then independent parts and listening quality.
No stem renderer downloaded, no generation benchmark performed. Deck1 remains
Keep On Running stopped at cue; original Emalkay still available in Engine Lab.
Current host snapshot: MemAvailable1658MiB, no swap, temperature58.4C. This is
not a capacity or real-time inference benchmark.

Official Rane documentation clarifies on-device generation is background
preparation: controls become available after rendering completes, and the
result is cached on disk. This must not be advertised as instant live separation.
https://support.rane.com/en/support/solutions/articles/69000878728-rane-system-one-on-device-stems-rendering

Follow-up native pad probe: sent channel4 HotCue mode0x2A twice, then toggled
notes0x39–0x3C. Output did NOT mute (master RMS ~300855/301021 before,
777138/785024 after,768191/775199 after second toggle set). Therefore this
sequence does not establish stem pad mode or isolation; it may have triggered
hot cues. Do not label this a successful stem-control test. Cue command stopped
output at zero. Need inspect native mode selection before further pad tests.

Engine process memory snapshot after loaded-demo tests:
RSS1282400KiB, PSS1266243KiB (~1.21GiB), PSS anonymous835536KiB,
PSS file410163KiB, locked1239170KiB; swap0. This is the Engine main process,
not the entire Pi, and not a matched BiteDJ benchmark. ps CPU39.4% is lifetime
average over2h15m, not instantaneous test load. Backlight0 confirmed.

## Native mapping investigation

Local reverse/Engine SHA256 and running /proc/159449/exe both equal
76fd56d8906a9818d3de3cdad03dc37d0eb1594fa910ec3ec3796f63b673e888.
Plain embedded QML extracted for local research in stems-static/block-258abdd.txt
identifies Stems Overrides Module. Its buttons require Track/Stemmed true, and
/Client/Preferences/Profile/Application/StemFxBehavior selects whether an
unshifted press routes to Stems/Acapella or Stems/AcapellaEcho (similarly
Instrumental). Shift reverses this choice. Thus raw0x27/0x28 cannot be treated
as a known dry-isolation test without reading that preference. Its output LED
reflects Stems/AcapellaState or InstrumentalState (127 active,1 inactive,0 no
stem track). These provide concrete verification targets for the next probe.

Existing saved-loop resources define Deck/Pads/View as the mode string and
STEMS as its stem mode. However the currently loaded mixer-properties helper
DOES NOT expose padsView1 despite an older saved-loop helper source doing so.
The attempted diagnostic therefore did not establish active pad mode. Avoid
assuming the local helper source is the currently loaded binary.

Generation setup: current /proc/159449/net/route is empty; launcher deliberately
uses a private network namespace with loopback only. A native online processor
download cannot work in that session without an explicit networking change or
an offline installation. No such change performed here.

## Official processor obtained — 2026-09-11

Matching Engine executable embeds https://inmusic.to/enginedj-aarch64-stems .
HEAD redirect resolved to:
https://public.inmusiccdn.com/Engine-Stems/1.4.0/RELEASE/ac49191a782b62e5/stems-processor.sqsh.signed
Downloaded locally (not installed on Pi):412516864bytes, SHA256
c0d7cc541eeb254104b8e565fe53c648ffa2df00e1fa15ba545c75347eb82b3c.
AZSI signed container; ordinary SquashFS starts at offset1024. Read-only local
extraction via unsquashfs -o1024 produced exactly two regular files:
- stems-processor:411885072bytes, AArch64 PIE, debug_info/not stripped,
  interpreter /usr/lib/ld-linux-aarch64.so.1
- libNNPredictionDispatcher_on.so:25667536bytes, AArch64 shared object.
Dependencies are libNNPredictionDispatcher_on, libstdc++, libm, libgcc_s,
libc, loader; RUNPATH ${ORIGIN}. Dispatcher itself needs standard C++/C libs.
Symbols identify zplane::StemsPro, ONNXImpl::predict, ONNXModel and embedded
ONNX convolution names. This is direct evidence of neural-network inference,
not merely guessing from filename. No explicit GPU/NPU dependency in DT_NEEDED;
dynamic loading and runtime requirements remain to be checked.
No generation execution/performance claim yet. Next: inspect CLI/protocol,
then isolated bounded Pi smoke test with memory/CPU limits, preserving Engine.
Do not publish package, extracted proprietary binaries or embedded model data.

## Native Pi startup confirmed

Copied the two processor files to the separate host directory
/home/pompu_5/engine-pi-lab/stems-probe-20260911 (outside running Engine rootfs).
Native Debian ARM64 execution succeeds without extra dependencies:
--help exit0/no output; --version exit0/stderr1.4.0 (~15ms each).
--stem with stdin EOF exits0 and stdout `preparing=failed\n\n` (~14ms).
Therefore exit0 alone is NOT render success; the streaming protocol response
must be validated. These runs used RLIMIT_AS768MiB, CPU5–8s, wall8–10s,
core dumps disabled. No model inference or peak-memory benchmark yet.
Evidence: stems-static/startup-probe.json and protocol-empty.json.
Symbols and strings show stdin/stdout parameter blocks, numChannels,
sampleRate,maxBlockSize,highQuality,residual,numThreads,session and returnFrames.
Next gate is reconstructing the parent/child protocol and a bounded real render;
not treating startup success or empty-input handling as successful separation.

## Processor protocol version identified

Disassembly of processor main shows parentVersion major must be1. This is the
processor protocol version, NOT Engine OS version5.0.4. Native bounded probe:
`stems-processor --stem --parentVersion 1.4.0` emits
`preparing=initialising`, a fresh session challenge, then a blank line.
`--action stem --parentVersion 1.4.0` behaves identically.
The same invocation with parentVersion5.0.4 returns preparing=failed.
All these EOF probes exit0. No audio data supplied and no render measured.

The next input is a parameter block containing channels, sample rate, maximum
block size, quality/residual flags, thread count and session response. The
processor validates a challenge response before preparing the model. Native
parent integration or a correct protocol client is needed; do not mislabel
EOF exit0 as initialized-model/render success. No changes to running Engine.

## Model preparation succeeds on Pi

Private isolated test client completed the native session handshake and sent
2channels,44100Hz,maxBlockSize512,highQuality0,residual0,numThreads1.
The unmodified processor returned preparing=started, then preparing=done with
numReturnChannels=8 after5.186seconds. Clean stdin closure exited0, no stderr.
Child maximum resident memory858112KiB (~838MiB). This includes model loading
and preparation, NOT audio inference throughput or peak full-render memory.
Limits:1100MiB virtual address space,20sCPU,25s response timeout,nice15,coreoff.
An earlier startup-only client stopped after preparing=started and killed its
child after3s; that -9 is the harness timeout, not an unexplained renderer crash.

Session material remains a mode0600 local file on the Pi test directory and
must not be published. Probe source has no embedded session material. Running
Engine was neither restarted nor patched. Next step: feed planar float blocks
and parse returnFrames+8channel output, then measure end-to-end duration and
output validity. Startup/preparation alone does not establish live stems.

First real-audio harness attempt: failed during model initialization before any
input audio, errorCode6 and ONNX Runtime std::bad_alloc; peak850672KiBRSS under
1100MiB RLIMIT_AS. This differs from the earlier successful preparation and
shows virtual-address caps can be sensitive to allocations/ASLR. Next attempt
uses2GiB address cap plus systemd cgroup1100MiB physical memory maximum,
no swap,CPUQuota100%,nice15,60s service deadline. Do not infer Pi incapacity
from the artificial virtual-memory-limit failure.

## First complete native audio render PASSED

Input:3seconds of Estara,20s offset, decoded stereo44100Hzfloat32;132300frames.
Unmodified official processor returned preparing=done,numReturnChannels8 in
3.2073s. Streamed planar float blocks512frames and explicit finish; received
exactly132300frames on all8channels, allfinite, nonzero signals, done=true,
exit0 and empty stderr. Render phase including input/output protocol and flush
5.6564s (~1.89seconds processing per1second audio); preparation excluded.
Peak childRSS908400KiB (~887MiB). Limits:1thread,CPUQuota100%,nice15,
MemoryMax1100MiB,MemorySwapMax0,RLIMIT_AS2GiB,60s service deadline.
Successful session handle2669 is terminal. Running Engine was unchanged.
This is a short clip with model context/flush overhead, not a sustained real-time
benchmark, listening assessment or simultaneous-playing DJ stability test.
Need longer matched clips and2thread comparison before rejecting live operation.
Probe source:stems-static/probe-render.py; private audio/material not for publish.

## Matched12second render comparison

Both runs use the same Estara excerpt20–32s,529200 stereo frames, input SHA256
5672f87b6879aa674bf20266ddc574bd566b292cf01d24988379e0c08c99548e.
Same flags/block512/44100Hz;1 or2threads with CPUQuota100% or200%,1100MiB
physical cap,no swap,nice15. Both return exactly529200frames,8finite channels,
done=true,exit0,no stderr. Per-channel peaks and energies agree across runs.

1thread: prepare3.630s;render14.480s;first output2.688s afterprepare;
peak918160KiB (~896.6MiB);1.207processing seconds/audio second.
2threads: prepare2.844s;render11.884s;first output2.169s afterprepare;
peak920800KiB (~899.2MiB);0.990processing seconds/audio second.

Two threads just keep up on this short test, with effectively no speed margin.
Cold startup+render remains14.728s for12s audio. Do not claim low-latency live
stems: model context delay, other tracks, sustained load and simultaneous DJ
playback remain untested. Running Engine's sampled frame logs stayed~60Hz and
max gaps<20ms; screen0; temperatures sampled61.15C/62.25C. Decks were stopped,
so this is NOT audio-dropout verification. Evidence rawJSONL files and
stems-static/matched-render-results.json. All test sessions terminal.

## Matched30second throughput comparison

Two threads: prepare2.998s;render26.169s for30s input (1.146x playback rate),
first audio2.223s afterprepare, peak898.81MiB.
Three threads: prepare3.009s;render29.798s (1.007x),first audio2.460s,
peak898.80MiB. Same inputSHA3d082237b517b943787b88b8f66be4196036294e01287ccdc35022be2aced361.
Both exact1323000frames,done=true,exit0; all8channels finite. Two threads were
faster here despite3thread run receivingCPUQuota300% instead of200%.
Do not assume more threads improve inference speed. Keep2thread candidate.

Full chunk arrival traces saved in render-30s-{2,3}threads.jsonl; summary in
matched-30s-results.json. Minimum initial buffering implied by these traces is
~2.224s/2.461s aftermodelready, with no concurrent active DJ audio. This is not
a guaranteed latency bound on other tracks/hardware conditions.
Engine frame samples~60Hz, observed gaps<25ms, sampledtemperature~63C,screen0.
Next required capacity gate: generation alongside actual playback and control
interaction. These were isolated renderer tests, not native Engine UI integration.

## Parsed model graph

The embedded resource410711419bytes parses as ONNX, producerPyTorch2.3.1,
opset11. Graph489nodes;154Conv,142LeakyRelu,75BatchNormalization,68Add,
11AveragePool,6Resize,6Concat,2MatMul,2Transpose,4Reshape,16Constant,
1ReduceMean,1Sub,1Sigmoid.536FLOAT initializers. Inputs[1,2,128,2048],
outputs[1,8,128,2048],bothfloat32. Full metadata:model-architecture.json.
No explicit Attention/Softmax operator in this graph; convolution optimization
is more relevant than a FlashAttention drop-in. Shape is not raw stereo PCM;
retain the processor's FFT/resampling/overlap-add frontend/backend when judging
end-to-end quality and speed. No model modifications or quantization performed.
Local model.private.onnx is mode0600 and must not be published.

## Generation alongside actual Engine playback

Ran native deck1 playback (prepared Keep On Running demo) while the isolated
2thread processor rendered the matched12s Estara input. Returned529200frames,
done=true,exit0,empty stderr; prepare3.045s;render11.920s;peak920256KiB.
This closely matches stopped-deck baseline11.884s, but only one run/one deck.
Before/after rendering master audio was nonzero with40distinct DMA buffers in
each probe.299PCM-status samples at~50ms allRUNNING, identical trigger timestamp
57307.128258694: no observed stream restart/XRUN state. This polling is not a
sample-perfect dropout detector or listening test and can miss brief issues.
Frame log four5s windows:60.02,59.42,60.02,60.02Hz;one26msgap,othersmax<20ms.
Stopped deck at cue in finally; verified zeroDMA output andbacklight0. Engine
PID159449 remained alive. Both fileswith-playback-{render.jsonl,status.json}
contain exact evidence. This proves bounded concurrent operation, not complete
native UI integration or guaranteed performance for two decks/scratching.

Native Profile→Playback UI inspected directly: Acapella/Instrumental FX is set
to Shift (green), Primary unselected. Therefore the current unshifted0x27/0x28
mapping routes to dry overrides; earlier uncertainty about that preference is
resolved. Evidence:stems-fx-preference.png. No preference values changed.
Cues/Loops tab has ordinary cue/loop settings but no stem-pad mapping selector.
Closed settings afterward. Pad mode and actual part isolation remain separate
verification items; don't infer them from this preference or generated output.

## Native override repeated-cue audio test

Repeated the same cue passage, play→40bufferprobe→cue for each measurement.
Baseline masterL/RMS299499.76; acapella toggle138392.71; restored302006.28;
instrumental toggle253533.13; restored298147.54. Right channel agrees closely.
Baseline/restoredvariation~1.3%; overridechanges~54%/~15%, substantially larger.
Identical restored peak2495328L/2650370R across all3baselinepasses. Thus native
0x27/0x28 overrides produce reproducible audio changes and return to baseline;
this resolves the earlier different-song-position confound. Both toggles were
restored; deck cued afterward. Evidence:native-override-repeat.json.
This supports functioning native acapella/instrumental controls on prepared
stems, not a listening judgment of separation quality or4individualpad mapping.

## Native four-pad stem mute verified (2026-09-11)

The System One v4.6 user guide specifies a dedicated Stems mode button,
with top pads Vocal, Melody, Bass, Drums. It does not use double Hot Cue.
Official reference: https://cdn.inmusicbrands.com/rane/systemone/SYSTEM%20ONE%20-%20User%20Guide%20-%20v4.6.0.pdf

On the running RMZ2 session116, left channel4 note0x2D selects the working
stem mode (fourth PadModeSelect entry). Notes0x39–0x3C toggle the four parts.
Prepared Keep On Running playback had master RMS310143.52/310128.62;
toggling all four pads produced exactly zero RMS and peaks across40 sampled
DMA buffers; toggling all four again restored nonzero audio, RMS
325067.78/326489.04 across40 distinct buffers. This directly verifies the
all-four mute and restore behavior. Individual part identities follow the
manual and still need isolated listening/measurement verification.

Evidence: stems-static/native-four-pad-test.json. All toggles restored, deck
cued, final DMA zero, backlight0. No runtime restart or assignment edit.
This corrects the earlier failed double-Hot-Cue experiment: it used the wrong
pad mode, not evidence of broken stem playback. Processor generation remains
an isolated harness; this does not prove native generation UI integration.

## Native processor installation path traced (2026-09-11)

Static evidence saved in stems-static/native-install-path.asm from the matching
Engine binary. Function0x976de0 searches /content and /data/content (plus a Qt
standard location) for stems-child-process.sqsh.signed. Function0x9775a0 creates
a destination beneath /secure-media/ from the package basename and invokes
0x9a3f40. That function starts `az01-signed-fs <absolute-package-path>` through
QProcess and waits up to30000ms for successful exit. This is the native mounting
helper, not mount.ddi. A mounted processor path is then used to locate the
stems-processor executable. No package installed into the live runtime yet.

Verified the signed-fs helper exists at /usr/bin/az01-signed-fs in session116.
Direct chroot execution fails with the mixed loader/libc error
`__nptl_change_stack_perm, version GLIBC_PRIVATE`. Invoking it with the same
/opt/pi-graphics/ld-linux-aarch64.so.1 and --library-path used by the Engine
launcher starts it successfully; it treats --help as an input filename and
reports that file missing. No mount was attempted. Therefore child executable
loader compatibility must be handled for native integration, not merely
copying the signed archive. Current launcher also drops SYS_ADMIN from Engine's
capability bounding set, so a native helper cannot acquire ordinary mount
privileges through that process. Prefer a controlled external mount in its
private mount namespace over broadly elevating the player; verify the native
already-mounted detection and exact destination before implementation.

Next concrete integration steps: prepare a loader-compatible helper path,
verify mount/destination requirements using the official signed package in
isolation, then test native package discovery without overwriting existing
content. Preserve screen0 and running session while doing preparatory work.

## Official signed package mount succeeds on Pi (2026-09-11)

Verified official package SHA256 on Pi and ran the unmodified az01-signed-fs
with the compatible loader in a disposable clone of Engine's mount namespace.
Final script: stems-static/probe-native-mount.sh. Result:
stems-static/native-mount-result.txt. Helper exit0; mounted directory
/secure-media/stems-child-process.sqsh contains stems-processor411885072bytes
and libNNPredictionDispatcher_on.so25667536bytes. No signature patch needed.
The clone needed host /dev nodes because Engine's minimal /dev lacks
/dev/loop-control. Thus loader, device visibility, and mount privileges are
all concrete integration requirements; the package/kernel mount path works.

The clone unmounted on exit. dmsetup reports no devices, losetup only the
pre-existing media-edmc88.img loop0. Initial setup attempt left an empty file
in live /content; verified size0 and removed precisely that placeholder.
Live Engine PID159449 stayed running; backlight0; no native package installed
and no generation UI claim. Mount success makes a controlled external mount
and native discovery the next step.

## Loader adapter staged into live session (2026-09-11)

Built processor-launcher.c as a static AArch64 executable with -Wall -Wextra
-Werror. It forwards all arguments to the compatible Pi loader and original
processor, specifies worker library paths, and removes Engine's LD_PRELOAD
injections. The adapter returned version1.4.0 in a disposable runtime clone.
Source and stage-native-processor.sh saved under stems-static; binaries remain
private on Pi. Original processor/model files were not modified.

Staged signed archive as /content/stems-child-process.sqsh.signed (hard link),
and read-only bind-mounted native-adapter at
/secure-media/stems-child-process.sqsh in Engine PID159449's mount namespace.
No player restart. Clicked Settings→Device→Add Stems Support; the row disappeared
without an online download dialog. Screenshot native-support-row-dismissed.png.
This suggests successful discovery but does not prove a render job: no worker
was running afterward and native logging supplied no confirming stem message.
Next verification is a bounded native render on isolated media. Current staging
is session-specific; launcher persistence and cleanup automation still needed.
Physical backlight remains0.

## Native render trigger exposes CPU-affinity fatal (2026-09-11)

Navigated ENGINE_LAB→Collection. Native half-swipe left on Estara exposed
Deck1 / Prepare / Stem. Tapped Stem at08:08:02 UTC. Engine aborted immediately;
no successful render inferred. The decisive log directly precedes Crashpad:
`[F] Failed setting CPU Affinity` in Queue thread. Kernel journal for the event
contains no OOM kill; coredumpctl is not installed and launcher disables cores.
Crashpad's later ELF-read errors are crash reporting noise, not identified cause.
The specific requested CPU mask and failing call are not yet captured.

Removed this experiment's archive hard link (verified inode identity) and empty
mount destination after session116 exited. Started the unchanged quiet launcher
as systemd transient unit engine-native117, logging native117.log. Engine is
running again as PID207224; screen0. No processor adapter staged into session117.
/tmp/engine-stems-ui.py updated to new PID. The adapter/package remain in the
isolated probe folder for reuse. Next fix requires tracing the render queue's
CPU affinity assumptions before another native render attempt; standalone
processor render results remain valid, but native UI generation is not working.

## Affinity failure narrowed to actual pthread request

Matching Engine disassembly: at0x17c19e4 it calls pthread_setaffinity_np with
128-byte CPU set assembled from a vector of CPU indices. A nonzero return
branches directly to the observed fatal at0x17c1d40. The subsequent
pthread_getaffinity_np has a separate failure message. Thus failure is the
setting call, not retrieval. Pi online CPUs are0-3. The requested mask/return
code remain uncaptured; an out-of-range mask is a hypothesis, not yet proven.
No affinity configuration found in shipped Engine text config files.
Evidence: affinity-setup.asm, affinity-fatal.asm, affinity-list.asm.
Separate native zplaneStemsRenderThreadCount override exists near0xc28310;
it controls renderer thread count and is not proven to fix queue affinity.
Evidence: stems-thread-count.asm. Do not conflate these two settings.

## Exact native affinity mask captured and adapter tested

GDB stopped StemRender thread at matching Engine call0x17c19e4 in session117.
Requested128-byte mask was0xf0 followed by zeroes: CPUs4–7, absent on Pi0–3.
Changed only that call's mask to0x0c (CPUs2–3); actual pthread_setaffinity_np
returned0. Removed breakpoint and detached. Queue progressed, then reported
child process Permission denied; that launch failure is still unresolved.
A later retry created another queue and hit the same fatal because the debugger
change was one-time. Session117 terminated; no claim of persistent fix from it.

Added pi-stems-affinity.c, intercepting exactly mask4–7 on a four-online-CPU
host and calling real pthread_setaffinity_np with2–3. All other requests pass
through, and real errors remain errors. Pi isolated test confirms assigned2–3,
return0; empty mask still returnsEINVAL22. Initial test exposed inherited0–1
affinity, so adapter checks onlineCPU count rather than treating inherited mask
as the complete set of usable CPUs. No fake success return.

Original quiet launcher retained. New run-flx6-stems-affinity.sh binds/preloads
adapter only into Engine. Started transient engine-native118/native118.log.
Removed prior stage hardlink and empty mount directory before restarting.
Processor not yet staged in session118. Need verify loaded adapter and rerun
native render with exec tracing to resolve the subsequent launch failure.

## User coordination correction — pause Pi optimization

User clarified model optimization should happen OFF Pi on the PC and that
multiple agents appeared to overlap. Root paused Pi model/render experiments
and sent the PC-only scope to thread01a08f80-4930-7151-b23d-82bd3624af10
(Locate processor model). Last check: Engine209928 running, no matching
stems-processor.real/probe-render/probe-with-playback workers, backlight0.
No further Pi benchmark/deploy work pending from root.

Last exec trace118 confirms attempted exec of signed archive itself:
/content/stems-child-process.sqsh.signed with -s -hv1.0.0 -pv1.6.0 =>EACCES.
The native-support settings row is already absent in118; no install action
available there. Therefore previous row disappearance alone did not prove the
mounted executable was selected. Adapter and archive are staged in118, but
native rendering remains unverified and now paused per user clarification.

## Local follow-up: installation order hypothesis

See stems-static/NATIVE-INSTALL-ORDER.md. Initialization checks package existence
and conditionally calls mount routine before publishing the manager. Late
staging can explain archive-as-executable behavior without initialized mounted
state. Next coordinated Pi test should stage before player startup and verify
actual exec target. This is static evidence, not a tested fix; Pi remains paused.
