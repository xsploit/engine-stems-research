# Engine DJ stems integration and lifecycle (parent binary, static)
Parent: reverse/Engine, sha256 76fd56d8906a9818d3de3cdad03dc37d0eb1594fa910ec3ec3796f63b673e888 (AArch64 PIE, stripped: no .symtab, 4131 dynsyms). Read-only.
Tag: [F] observed fact (address); [H] hypothesis; [B] blocked. Class/method names quoted are RTTI/QMeta strings in the binary, not my inference.

## A. Container and file lifecycle [F]
Observed [F]: strings "stems.mp4" (0x1be0258), "*.stems"/".stems" (0x1be0118/0x1bcaa98), ".stems_temp" (0x1beddb8), "/EngineDJ/Stems/" (0x1bedda0); a writer-construction failure log "Can't create ffmpegFileWriter" (0xc29030) on the render path.
Hypothesis [H]: that the sidecar is an 8-channel AAC-in-MP4 file. I did NOT read any codec/bitrate/channel-layout parameter in this binary; the "eight-channel AAC" property comes from STEMS-ASSESSMENT.md's ffprobe of an existing local file, not from Engine code. Container/codec parameters (profile, bitrate, channel layout tag, sample rate) remain UNVERIFIED here. The strings near 0xc299d4 ("-hv", "1.0.0", "-pv") are adjacent literals I did not tie to an ffmpeg argv construction.
- DB state: SQLite table StemsInfo with GET_STEMS_STATUS() window function (0x1bd2f24-0x1bd2fa8, 0x1c1c280); per-track "stems_count" (0x1bd3588), "stemsStatus" (0x1c132b0).
  QML track state enum (0x1fc77b9-0x1fc783d): stems==1 inStemsQueue, ==2 renderingInProgress, ==3 isStemmed (done). [F]
- Cache/invalidation: "stems list cache" job (0x1bd61e8, 0x1bd6238); "stems.downloaded" marker (0x1be0850); RelocateMissingFileJob::relocateStemsFile (0x1bd5588) moves the stems file when the source track moves; RemoveStemsJob deletes it (0x1be1990).
Informs BiteDJ: store stems as an 8-channel MP4/AAC sidecar keyed by track identifier, with a small status table (queued/rendering/done) and a relocation/removal hook. [H that AAC codec params match Engine exactly.]

## B. Render job pipeline and queueing [F]
- Classes present (RTTI): StemsQueueManager, RenderStemsPreCheckJob, RenderStemsJob, RemoveStemsJob, StemsAudioProcessor, StemsDataAccessor, DownloadStemsProcessorJob (0x243a9a0-0x243acf0).
- Flow strings: RenderStemsPreCheckJob (drive-space + skip checks, 0x1be0268-0x1be1899) -> RenderStemsJob "start render" (0x1be04e1) -> on success copy temp to target (0x1be0651) -> DB status. Abort path "RenderStemsJob: abort" (0x1be0468); progress via "stemsRenderProgress" (0x1be4e70) / QML row.stemsRenderProgress.
- Cancellation: StemsQueueManager.abortRenderTracks() (QML 0x217c20a), clear-queue UI (0x1fe9b7b), renderStemsQueueCount / totalRenderStemsQueueCount properties (0x236cebf).
- Pre-check enforces free space ("Not enough space", "IncreaseStemsRequiredSpace" 0x1bd73c8) and a StemsDirectorySizeWatcher (0x23e3af8).
Informs BiteDJ: model rendering as a cancellable queue with a pre-check (space, already-rendered, track exists) and per-track progress; keep it off the audio thread.

## C. Processor invocation, thread count and child lifetime
CORRECTION to round 7: I previously wrote "pipe(2)+fork/exec of /bin/sh". The fork/exec is NOT in this region; that was an over-reading of nearby strings.
Observed code paths [F]:
- In 0xc28000-0xc2b400 the only libc process/IO calls are: pipe@plt x2 (0xc286b8, 0xc28830), waitpid@plt x1 (0xc29664), close@plt x1, access@plt, fileno@plt. There is NO fork/execv/posix_spawn/kill call in this region (checked 0xc24000-0xc2b400).
  => two pipes (child stdin + stdout) are created here and a child is reaped here; the actual spawn happens through an out-of-region helper (a "/bin/sh" string at 0x1bdf8e0 is referenced at 0xc29d40 and passed to a helper at 0x1895ec0).
- The class implementing this is reached through the vtable at 0x2a8f8f0 whose typeinfo name is "19StemsAudioProcessor" (0x243a9b8, typeinfo 0x2b3d6f0). Virtuals: 0x986460, 0x987240 (dtors), 0xc27f2c, 0xc293a8, 0xc24b60. The waitpid at 0xc29664 lies inside the virtual entered at 0xc293a8. [F]
- Thread count: value comes from a Qt property lookup, not an environment variable: helper 0xc69d30 tail-calls QObject::property(const char*) (0xc69d84) with the name "zplaneStemsRenderThreadCount" (0xc28318). If absent -> 0xc284e0 sets 1. If present, the string is converted with base 10 (0x393478) and accepted only when the conversion flag is set AND value > 0 (0xc28afc: cmp x0,#0 / cset gt / tst), then narrowed with sxtb w22, w0 (0xc28b10) - i.e. the accepted value is truncated to a signed byte before use. Otherwise 1 (0xc28380). It is then written as protocol field "numThreads" (0xc2a90c). [F]
  Scope: this is the code path in THIS build; the property's value may be supplied per device/config, so "1" is only the fallback when the property is missing or invalid, not a global default. [H otherwise]
Hypotheses, explicitly not proven [H]:
- One child per render (per output file): supported by the pipes+waitpid living in the same processor object that the render setup constructs alongside the output file, but object reuse across tracks was NOT traced.
- No pool/warm worker: NOT established. Absence of pool-like strings is not evidence; the spawn helper and any caching live outside the region I read.
Informs BiteDJ: a subprocess with a stdin/stdout param+ack protocol and an explicit reap is the shipped shape; whether to pool or keep warm is an open design choice, not a copy of Engine.

## D. Playback selection lifecycle [F]
- On deck load, TrackDeckModes::StemsMode path logs "no pre-rendered stems found" / "pre-rendered stems found" (0xe50f58/0xe50fbc), then "selecting pre-rendered stems" + "initialising pre-rendered stems" (0xe52a10/0xe52a64) vs "selecting unstemmed track" (0xe529ac). So playback picks the sidecar when present, else the plain track.
- StemMixer::Listener, StemsPadController, DeckStemsModeHandler, StemsStateSequence (0x1bf1748-0x2491190) are the realtime mix/routing objects.

## E2. Mixer class graph (round 8) [F]
Resolved via .rela.dyn parsing (relascan.py): typeinfo "N9StemMixer8ListenerE" name@0x2490088 -> typeinfo 0x2b505e8. Classes whose typeinfo lists it as a base: "17StemsStateAdapter" (0x2b50708), "17StemsLevelControl" (0x2b50dd8), one unnamed at 0x2b52170, "20AutoLoopStemsControl" (0x2b5eb90). "DeckStemsModeHandler" typeinfo 0x2b50a08 is referenced from 0x2b4fb38, 0x2b5c2b0, 0x2b5c308.
None of these listener typeinfos led to a vtable slot carrying a channel index, and no decoded-channel-pair -> named-stem assignment was reached. The listeners are control/state objects (level, pad state, auto-loop), i.e. the mix-control side, not the demux side.

## E. Stem identity - still blocked [B]
- The only channel-adjacent routine found (0xe76040) builds a mode name from a 32-bit mask: it tests mask bits and appends labels in the fixed textual order Vocal(bit via w22 low path, 0x762b4), Bass(w23, 0x762f4), Drums(w22, 0x760fc), Melody(w24, 0x76320), separated by " | ". This is an FX/selection MASK-to-string, keyed by bit position, NOT a processor output channel index. [F it is a bitmask formatter; H that bit order equals channel order - unproven]
- No routine was found that indexes the decoded .stems channels (0,1)(2,3)(4,5)(6,7) by a Vocal/Bass/Melody/Drums enum. That mapping is likely inside the AAC demux + StemMixer consumer, not reached in this bounded pass.
Missing evidence: the StemMixer/deck consumer that assigns decoded channel pairs to named stems, or one dynamic solo-correlation capture (HANDOFF.md test B).
