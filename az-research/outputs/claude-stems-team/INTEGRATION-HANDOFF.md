# Integration handoff: Engine stems host-side behaviour (static research only)
Scope: what an independent implementation can rely on as observed behaviour of Engine's host side, plus what remains unknown.
No design recommendation is implied: nothing here endorses a storage codec, a pooling strategy or any particular architecture.
Sources: ENGINE-STEMS-INTEGRATION.md (addresses), PIPELINE-SPEC.md (processor DSP), HANDOFF.md (dynamic tests).

## Verified (call/dataflow evidence, addresses in ENGINE-STEMS-INTEGRATION.md)
1. The renderer is an external child process: vfork (0x1927870) inside launcher 0x1927690, child branch dup2's the pipe ends onto its standard descriptors, closes the unused ends, then execve@plt (0x19285d0) with explicit path/argv/envp from the launcher context, and _exit only if exec fails. Two pipes are created by the owning object.
2. The wire protocol is a text parameter block (numChannels, sampleRate, maxBlockSize, highQuality, residual, numThreads, session) with ack/reply blocks, frame counts via "returnFrames" and channel count via "numReturnChannels".
3. Shutdown is cooperative, not signal-based: the parent sends action=done, consumes the doneReply (including returnFrames), then blocks in waitpid (options 0) with an EINTR retry loop. No SIGTERM/SIGKILL is used anywhere in the traced paths.
4. Progress polling uses non-blocking waitpid (WNOHANG); a return of 0 means alive and un-reaped.
5. One processor instance per render setup: constructing a new one destroys and frees the previous (operator delete size 0x3d8). No live child is reused across renders on this path.
6. Thread count is a Qt property, validated > 0 and narrowed to a signed byte before being sent as numThreads; 1 is the fallback when the property is missing/invalid in this build.
What this can inform: a subprocess-based renderer needs an explicit cooperative-quit message, a final-reply drain, and a blocking reap with EINTR handling; a non-blocking poll is enough for progress but never guarantees reaping.

## Not established (do not assume)
- Sidecar container/codec parameters. Unverified from this binary.
- Which literal becomes the execve image path ([ctx+0x60]); a shell is plausible but unproven.
- Failure/hang handling of the quit handshake (no timeout or escalation path found, not exhaustively traced).
- Abort -> temp-file/status cleanup linkage.
- Any instance reuse outside the render-setup path.
- Stem identity of processor output indices 0..3.

## Exact next evidence needed
- Stem identity: the demux/mixer consumer that assigns decoded channel pairs to named stems, or the dynamic solo-correlation capture (HANDOFF.md test B). Static route into that consumer was not found via RTTI.
- Abort cleanup: requires following StemsQueueManager/RenderStemsJob result handling - a broad survey, not a single hop.

## Scope-limited static step that remains
- None for the launcher: exec is settled (execve after dup2; 0x51caa0 turned out to be a refcount helper, not exec). The only residual launcher detail is which literal is bound into the execve image-path field [ctx+0x60]; it does not affect any lifetime or protocol conclusion.

## Stopping point
Everything else outstanding (stem identity, abort/status cleanup, container parameters, equivalence of the DSP reimplementation) requires either a broad new parent survey or an original-run capture. Those are out of the static, read-only scope used so far and should be treated as a deliberate stopping point rather than an open thread.
