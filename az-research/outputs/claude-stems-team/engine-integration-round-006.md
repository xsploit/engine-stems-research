# Engine DJ stems integration and lifecycle (parent binary, static)
Parent: reverse/Engine, sha256 76fd56d8906a9818d3de3cdad03dc37d0eb1594fa910ec3ec3796f63b673e888 (AArch64 PIE, stripped: no .symtab, 4131 dynsyms). Read-only.
Tag: [F] observed fact (address); [H] hypothesis; [B] blocked. Class/method names quoted are RTTI/QMeta strings in the binary, not my inference.

## A. Container and file lifecycle [F]
- Output container is MP4: "stems.mp4" (0x1be0258), extension "*.stems"/".stems" (0x1be0118/0x1bcaa98), temp ".stems_temp" (0x1beddb8), install dir "/EngineDJ/Stems/" (0x1bedda0).
- Writer: the render path builds output through an ffmpeg file writer ("Can't create ffmpegFileWriter" 0xc29030, ffmpeg args near 0xc299d4 "-hv"/"1.0.0"/"-pv"). So the 8-channel processor output is muxed to an MP4/AAC ".stems" file, consistent with STEMS-ASSESSMENT.md's "one eight-channel AAC stream".
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

## C. Processor invocation and warmth [F]
- Engine spawns the external stems-processor per render via pipe(2)+fork/exec of /bin/sh (0xc286b8 pipe, 0xc29d40 "/bin/sh", 0xc299d4 argv "-hv 1.0.0 -pv"), one child per output file. The processor image is a signed squashfs "stems-child-process.sqsh.signed" (0x1bdf858) mounted at runtime (0x1bdf7f0), or embedded (EmbeddedStemsProcessorDownloadManager).
- Thread count: config property "zplaneStemsRenderThreadCount" (0x1bee3f8) is read (0xc28318), validated > 0 (0xc28afc: cmp x0,#0; cset gt), default 1 on failure (0xc284e0 mov w22,#1), then sent to the child as protocol field "numThreads" (0xc2a90c). [F]
- NOT kept warm: the child is created inside the per-file render setup (spawn at 0xc285f0 within the same function that opens the output file and cd's to the stems folder) and the parent uses a request/reply "ack" protocol (0xc2a670-0xc2a970) then closes. No persistent-worker or pool string was found. [H] one process per track render; reuse across tracks not evidenced.
Informs BiteDJ: a per-track subprocess with a stdin/stdout param+ack protocol is the shipped design; a warm/pooled worker would be a BiteDJ improvement, not a copy.

## D. Playback selection lifecycle [F]
- On deck load, TrackDeckModes::StemsMode path logs "no pre-rendered stems found" / "pre-rendered stems found" (0xe50f58/0xe50fbc), then "selecting pre-rendered stems" + "initialising pre-rendered stems" (0xe52a10/0xe52a64) vs "selecting unstemmed track" (0xe529ac). So playback picks the sidecar when present, else the plain track.
- StemMixer::Listener, StemsPadController, DeckStemsModeHandler, StemsStateSequence (0x1bf1748-0x2491190) are the realtime mix/routing objects.

## E. Stem identity - still blocked [B]
- The only channel-adjacent routine found (0xe76040) builds a mode name from a 32-bit mask: it tests mask bits and appends labels in the fixed textual order Vocal(bit via w22 low path, 0x762b4), Bass(w23, 0x762f4), Drums(w22, 0x760fc), Melody(w24, 0x76320), separated by " | ". This is an FX/selection MASK-to-string, keyed by bit position, NOT a processor output channel index. [F it is a bitmask formatter; H that bit order equals channel order - unproven]
- No routine was found that indexes the decoded .stems channels (0,1)(2,3)(4,5)(6,7) by a Vocal/Bass/Melody/Drums enum. That mapping is likely inside the AAC demux + StemMixer consumer, not reached in this bounded pass.
Missing evidence: the StemMixer/deck consumer that assigns decoded channel pairs to named stems, or one dynamic solo-correlation capture (HANDOFF.md test B).
