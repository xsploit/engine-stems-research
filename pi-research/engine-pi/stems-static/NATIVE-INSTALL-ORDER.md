# Native installation ordering: local analysis, no Pi changes

**Native testing remains paused.** The original pre-mount-only candidate is
superseded by `run-flx6-stems-prestart-directory.candidate.sh`, which includes
the directory adapter tested against firmware Qt under emulation. Neither is
a confirmed full Engine rendering repair. See the latest integration note below.

## Evidence

The observed session118 exec attempt used the signed package pathname and failed
EACCES. That trace proves the wrong path was selected, not that the executable
adapter lacks file permission. Direct adapter --version worked in isolation.

In the matching Engine binary, initialization at0x7ea654 clears the manager's
mounted-object pointer and calls0x97c4c8. When true, branch0x7eaa88 calls the
mount routine0x9775a0 before storing the manager into the owning object.
Availability predicate0x97c4c8 returns true for a non-null mounted object;
otherwise it retrieves the manager path through virtual slot0x90, constructs
QFile, and calls QFile::exists. The getter0x976de0 returns mounted-directory plus
/stems-processor when the mounted object exists, but searches package paths
when it does not. There is another direct mount caller0x97cadc after a job
success branch; it was not established that the UI click executed that branch.

Saved disassembly: mount-callers.asm, mount-startup-condition.asm,
mount-availability.asm, native-install-path.asm.

## Interpretation and next test

Staging the package after Engine initialized can make the availability check
true without initializing its mounted-object state. This matches both the
vanishing Add Stems Support row and subsequent attempt to execute the archive.
This is a supported hypothesis, not dynamic proof of startup repair.

When Pi work is explicitly resumed and coordinated, prepare the read-only
processor directory and signed package before starting Engine, within its
private mount namespace. Keep the compatible worker launcher and CPU-affinity
adapter. Verify startup takes the existing-mount path and native exec selects
/secure-media/stems-child-process.sqsh/stems-processor, preserving normal
arguments. Stop at any unexpected path or initialization failure; don't mark
success merely because the settings row disappears.

Then verify a single isolated track reaches done, produces valid stored stems,
and reloads with four-part native audio controls. Record workload/process
inventory and prohibit concurrent benchmarks. Existing per-session staging
script intentionally does not implement this pre-start ordering and should not
be presented as a completed installer. No Pi call or deployment made in this
analysis pass.

## Local startup candidate prepared

`prepare-startup-candidate.py` generates a new launcher from a recognized lab
launcher; it never deploys or executes the result. The illustrative output
`run-flx6-stems-prestart.candidate.sh` was generated from the local quiet
launcher, not fetched from the current Pi session. Before deployment, regenerate
from the then-current Pi launcher so any later input/audio changes are retained.

The inserted setup runs before the sole Engine launch, with shell error handling
still enabled. It verifies the signed archive hash, requires the existing worker
adapter and dispatcher, mounts both package and adapter read-only in the private
namespace, and supplies the CPU-affinity shim to Engine. It may leave empty mount
point files/directories in the lab runtime; it does not install archive contents.
Paths still follow the current Pi lab layout. It is an experiment, not a portable
installer or a verified native-rendering repair.

Local validation passed: shell syntax, deterministic generated output, mount
ordering before Engine, exactly one affinity preload insertion, and refusal of
duplicate setup or ambiguous/non-isolated launcher structure. No mount, worker,
Engine launch, deployment, SSH or other Pi call was performed. The actual native
exec path and a complete render/reload test remain the acceptance gates above.

## Directory-filter check changes the next action

Further examination of the actual mount branch shows `QDir::entryList` called
at 0x9778a0 with Filters=0x6000 and SortFlags=-1. A positive count reaches the
manager-pointer store at 0x977804, skipping az01-signed-fs. A zero count instead
branches through 0x977934 to the unmount/remove/helper path. Therefore the
earlier shorthand "accepts a nonempty directory" was too broad: the filtered
entry count is the decisive condition.

The binary string at 0x1bdf890 is `/secure-media/`, 0x1bdf8d0 is
`Image already mounted at:`, and 0x1be1328 is `az01-signed-fs`.
QFileInfo::completeBaseName correctly maps the signed archive to the expected
`/secure-media/stems-child-process.sqsh` directory.

`mount-path-probe.cpp` executes the matching Qt operations on the PC's Qt
6.11.2, using a temporary directory and synthetic file. Filter 0x6000 yields
zero entries with the file present; adding AllEntries (0x7) yields one. An
explicit directory refresh excludes stale-entry caching. Log:
`mount-path-probe.log`. This is evidence against the assumed shortcut, not
proof of the firmware Qt version's behavior. No firmware Qt Core library was
found in the current local Engine files during this check.

Next resolve the firmware library's filter semantics (or inspect an already
available matching source/runtime) before treating pre-mounting as sufficient.
If it behaves like the PC Qt build, startup ordering alone will still invoke
the mount helper; the candidate needs a different tested integration. Pi remains
paused. No executable or runtime was changed by this check.

## Matching library located; upstream 6.7.2 confirms filter issue

Expanded local search found the preserved SystemOne runtime at
`/home/subsect/Documents/Codex/2026-09-10/so/work/engine/runtime64`.
Its ARM64 `usr/lib/libQt6Core.so.6.7.2` has ELF BuildID
`bc1e6848491d1715a0423421a73ff78f9d9058a8`. Thus the earlier missing-library
statement applied only to the root thread's Engine directory, not all local
research files. No Pi retrieval was needed.

Qt's official v6.7.2 source corroborates the PC result:
https://github.com/qt/qtbase/blob/v6.7.2/src/corelib/io/qdiriterator.cpp
The constructor substitutes AllEntries only for NoFilter, and matchesFilters
excludes files without Files and directories without Dirs or AllDirs.
0x6000 sets neither. This materially weakens pre-mount-only repair even for
the matching upstream version. It is source corroboration, not execution of
the firmware library or proof that it has no vendor modifications.

A possible next local experiment is a narrowly scoped Qt entryList adapter
that adds AllEntries only for this processor mount directory and exact filter,
leaving all unrelated directory queries intact. It must be verified using real
Qt calls and then compiled against compatible ARM64 Qt headers before any Pi
test. Do not globally change directory filtering or claim native rendering is
fixed from a directory probe alone.

## Scoped directory adapter passes desktop execution

Implemented original code in `pi-stems-directory.cpp`. It interposes the exact
Qt entryList overload imported by Engine and calls the original implementation
via RTLD_NEXT. It adds AllEntries only when an absolute, explicitly opted-in
`ENGINE_LAB_STEMS_MOUNT` equals the queried directory, filters are exactly
0x6000, sorting is -1, and the launcher, real processor, and dispatcher exist
(the two executables must also be executable). It returns real directory
entries; it does not fabricate a successful mount or render. Disabled by default.

Built on the PC with Qt 6.11.2 using C++17, -fPIC, -shared, -Wall, -Wextra,
-Werror, pkg-config Qt6Core flags, and -ldl. `directory-adapter-probe.cpp` runs
actual Qt calls with LD_PRELOAD and temporary synthetic files. All checks pass:
explicit target lists three files, unrelated directory/filter/sort behavior
is unchanged, ordinary listings remain correct, absent opt-in does nothing,
relative opt-in is rejected, and missing processor components do not qualify.
Evidence: `directory-adapter-probe.log`.

The shared library is a desktop test artifact at /tmp/pi-stems-directory.so;
it is NOT an ARM64 deployment artifact. The startup generator is intentionally
unchanged and still on hold. Before integration, build with compatible ARM64
Qt headers, verify linkage against the preserved firmware Qt, and verify the
native branch and successful render when Pi work is authorized again. This
test made no Pi calls and touched no firmware, music, or installed profile.

## ARM64 adapter passes against the preserved firmware Qt

Built `pi-stems-directory.arm64.so` and `directory-adapter-probe.arm64`
locally with workspace-contained Zig 0.13.0 targeting aarch64-linux-gnu.2.35.
Used Debian ARM64 Qt 6.4.2 development headers (older compatible Qt 6 API),
linking directly to the preserved firmware Qt 6.7.2 library. Download sources
and hashes are in `cross-tools/sources.json`; Zig archive hash was verified
against its official download index. No system packages were installed.

Executed the ARM64 probe with /usr/bin/qemu-aarch64-static, the preserved
runtime64/lib/ld-linux-aarch64.so.1, library paths runtime64/usr/lib and
runtime64/lib, and loader --preload of the ARM64 adapter. Every scoped-filter
check passed with exit 0. Evidence: `directory-adapter-probe-arm64.log`.
The disabled-by-default case also reproduces the empty listing on the actual
firmware Qt, so the filter issue is now observed through execution rather
than inferred solely from upstream source or the PC Qt version.

This validates this adapter's linkage and directory operations with the
preserved ARM64 Qt under emulation. It does not execute Engine initialization,
native mounting, processor rendering, audio playback, or the Pi. Next integrate
the tested adapter and explicit directory opt-in into a fresh startup candidate;
native testing remains paused pending coordination.

## Directory adapter integrated into a fresh local candidate

Updated the generator and created
`run-flx6-stems-prestart-directory.candidate.sh`. It requires the tested ARM64
adapter to be staged later as `$lab/pi-stems-directory.so`, binds it read-only,
then passes its preload and exact `ENGINE_LAB_STEMS_MOUNT` opt-in only in the
final Engine env invocation. Helpers started earlier receive neither addition.
The processor launcher clears LD_PRELOAD before executing the real worker.

Validation used the shell to expand the final launch command with a stub timeout
function that captures arguments and executes nothing. Compared with the input
quiet launcher, all existing Engine arguments and environment values are
unchanged; only the two shim preload entries and directory opt-in are added.
Generator output is deterministic, shell syntax passes, mounts precede launch,
and duplicate/ambiguous inputs are rejected. Results:
`startup-directory-validation.json`. No Engine, mount or Pi operation occurred.

Regenerate from the then-current Pi launcher before deployment to retain any
changes made since the local quiet-launcher snapshot. Stage the ARM64 artifact,
not the desktop .so. Full startup, correct native exec path, render completion,
stored-stem reload and native audio-control tests remain unproven.

## Reproducing the ARM64 check

`check-directory-arm64.py` accepts explicit runtime, Zig and Qt-header paths,
builds both artifacts into a fresh temporary directory, executes the probe with
the firmware loader under QEMU, and records source/library hashes and output.
It cleans only its own temporary build directory. Reproduction passed with
exit 0; see `directory-arm64-reproducible-result.json`.

From this workspace:

```sh
python3 engine-pi/stems-static/check-directory-arm64.py \
  --runtime /home/subsect/Documents/Codex/2026-09-10/so/work/engine/runtime64 \
  --zig engine-pi/stems-static/cross-tools/zig-linux-x86_64-0.13.0/zig \
  --qt-headers engine-pi/stems-static/cross-tools/qt-dev/usr/include/aarch64-linux-gnu/qt6 \
  --result engine-pi/stems-static/directory-arm64-reproducible-result.json
```

The runtime remains a private prerequisite; the runner does not distribute it,
download files, install system packages, or contact the Pi.
