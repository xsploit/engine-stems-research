# Engine DJ stems integration (parent binary, static, consolidated)
Parent: reverse/Engine sha256 76fd56d8906a9818d3de3cdad03dc37d0eb1594fa910ec3ec3796f63b673e888 (AArch64 PIE, stripped). Read-only. Processor: stems-processor sha256 3c6f1cb7... (see PIPELINE-SPEC.md).
Sections 1-3 are proven by decoded call/dataflow at the cited addresses. Section 4 is string-derived only. Section 5 lists what is NOT established. Section 6 is the correction history. Previous revision kept as 56-integration-prev.md.

## 1. Child process launch [PROVEN]
- Launcher 0x1927690 calls vfork@plt (0x1927870) and has the classic exec-failure sync path (waitpid 0x19278c8, close pairs 0x19278e8/0x19278f4, errno 0x19279cc, access 0x1927ab0). Call site 0xc29e94, result returned via sret x8 = sp+0x170 (45-launch-args.txt).
- The processor object creates two pipes (pipe@plt 0xc286b8, 0xc28830) for the child's stdin/stdout and initialises its PID field +0x398 to -1 (0xc2890c). After launch the PID is stored there (0xc29f00) and read at 0xc29430, 0xc2964c, 0xc298cc, 0xc24cd0, 0xc24db8, 0x1241688, 0x12417dc, 0x1240e74.
- Protocol over those pipes: parameter block numChannels/sampleRate/maxBlockSize/highQuality/residual/numThreads/session (0xc2a76c-0xc2a970), replies "ack"/"initReply"/"reply", "returnFrames" (0xc2a3e0), "numReturnChannels" (0xc2adf0).
- numThreads source: Qt QObject::property (helper 0xc69d30 -> 0xc69d84) named "zplaneStemsRenderThreadCount" (0xc28318); base-10 conversion (0x393478) accepted only if conversion ok AND value > 0 (0xc28afc), then narrowed by sxtb (0xc28b10); otherwise 1 (0xc284e0). "1" is this build's fallback for a missing/invalid property, not a device-wide default.

## 1b. Exec path inside the launcher [PROVEN, with one scoped ambiguity]
- 0x51caa0 is NOT an exec helper: it is a shared-pointer/refcount increment (atomic ldaddal at 0x51cad8). Classifying it from the call position alone would have been wrong.
- vfork at 0x1927870 returns into w19; w19 == 0 takes the child branch at 0x192854c. That branch performs dup2@plt three times (0x1928560, 0x1928590, 0x19285b8) to attach the pipe ends to the child's standard descriptors, closes the unused ends (close@plt 0x1928578, 0x1928580, 0x19285a8), then calls execve@plt at 0x19285d0 and, on failure only, _exit@plt at 0x192860c.
- execve arguments come from the launcher context object: x0 = [ctx+0x60] (image path), x1 = [ctx+0x68] (argv), x2 = [ctx+0x78] (envp); argv is copied from the caller structure at 0x1927850 ([caller+0x38] -> [ctx+0x68]).
- AMBIGUITY (scoped): the same launch function constructs a std::filesystem::path from the literal "/bin/sh" (0x1bdf8e0) at 0xc29d40, and the stems-processor path literal is used at 0xc285f0, but I did not trace which string is bound into [ctx+0x60]. So "the executed image is a shell" is consistent with the evidence but NOT proven; the exec mechanism (execve with explicit path/argv/envp, after dup2 redirection) IS proven. No runtime argv contents were read or recorded.

## 2. Child shutdown and reaping [PROVEN]
- Polling: all early waitpid sites pass WNOHANG (w2=1): 0xc29664, 0xc24dc4, 0x12417ec, 0x1240efc. Return 0 means the child is still alive and nothing was reaped.
- Graceful shutdown handshake: when teardown finds the child alive it enters 0x1240e4c, which writes protocol "action" = "done" to the child's stdin stream (ostream inserts 0x1240f88-0x1240fd0, flush 0x1240ff4) and reads the "doneReply" block (0x124106c), including "returnFrames" (0x12410e0).
- Blocking reap: after the handshake it calls waitpid with options 0 at 0x1241344 and loops on a second blocking waitpid at 0x1241378, retrying while errno == EINTR (4) at 0x124138c; errors are reported through system_category (0x12413a0).
- No signal is sent: no kill@plt in 0xc24000-0xc2b400 or 0x1241600-0x1241a00; no sleep/nanosleep in that teardown range.
=> Lifetime, evidence-backed: the child is asked to finish over the protocol, its final reply is consumed, and the parent then blocks until the child is reaped.

## 3. Instance lifetime per render [PROVEN]
- The owner holds a single processor pointer at [owner+0xd0]. At 0xc289d0-0xc289ec a newly constructed instance replaces it; the previous instance is destroyed (0x1241664) and freed with operator delete(ptr, 0x3d8).
- Each render setup therefore builds a fresh processor object with fresh pipes and a fresh PID field, and tears the previous one down. No reuse of a live child across renders appears on this path.

## 4. Library/queue/file surface [STRING-DERIVED ONLY - no call/dataflow traced]
These come from string literals, SQL text and embedded QML, not from decoded code paths:
- Sidecar naming/paths: "stems.mp4" (0x1be0258), "*.stems"/".stems" (0x1be0118/0x1bcaa98), ".stems_temp" (0x1beddb8), "/EngineDJ/Stems/" (0x1bedda0); a writer-construction failure log "Can't create ffmpegFileWriter" (0xc29030).
- DB/status: StemsInfo table and GET_STEMS_STATUS window function (0x1bd2f24-0x1bd2fa8, 0x1c1c280), "stems_count" (0x1bd3588); QML track state 1=queued, 2=rendering, 3=stemmed (0x1fc77b9-0x1fc783d).
- Jobs/queue: RenderStemsPreCheckJob, RenderStemsJob, RemoveStemsJob, StemsQueueManager, DownloadStemsProcessorJob (RTTI 0x243a9a0-0x243acf0); abort log "RenderStemsJob: abort" (0x1be0468); QML abortRenderTracks() (0x217c20a); free-space checks (0x1be0530, 0x1bd73c8).
- Deck load selects pre-rendered vs plain track ("pre-rendered stems found" 0xe50fbc, "selecting pre-rendered stems" 0xe52a10, "selecting unstemmed track" 0xe529ac).

## 5. NOT established
- Container/codec parameters of the .stems sidecar. No codec, bitrate, channel-layout or sample-rate argument was read from Engine. The "8-channel AAC" property comes from an ffprobe of an existing local file recorded in STEMS-ASSESSMENT.md, not from this binary.
- Behaviour when the done handshake fails or the child hangs: no timeout, kill or escalation path was found, but I did not trace every branch; the blocking waitpid retries only on EINTR.
- Which literal is bound into the execve image-path field [ctx+0x60] (see section 1b ambiguity). 0x51caa0 is settled: it is a refcount helper, not exec.
- Abort -> temp-file/status linkage: 0xc2d4ac, reached from the abort region, is a mutex-guarded setter taking a double in d0 (progress), not a cancel. The path from abort to file/status cleanup is untraced.
- Whether any code path outside render setup reuses a processor instance. Absence on this path is not global absence.
- Stem identity (which output index is vocals/drums/bass/melody): blocked; see PIPELINE-SPEC.md section 9.

## 6. Correction history (compact)
- R7: "spawns per render via pipe(2)+fork/exec of /bin/sh" - WRONG on mechanism. 0x1895ec0 is std::filesystem::path::path(const char*) (strlen 0x390948, _M_split_cmpts 0x391f08); it launches nothing. Real launcher is 0x1927690 (vfork).
- R7: "8-channel MP4/AAC sidecar" stated as fact - downgraded to unverified (section 5).
- R7: "thread count read from config/env, default 1" - refined: Qt property, >0 check, sxtb narrowing, fallback 1 in this build only.
- R8: "NOT kept warm / no pool" asserted from string absence - replaced by the per-render construct/destroy dataflow in section 3.
- R8/R9: "abandonment vs clean shutdown unknown" - resolved in section 2 (done handshake + blocking reap).
- R6-R8 stem-name/RTTI label-order inferences: withdrawn as evidence; not revisited.
