#!/usr/bin/env python3
"""Generate, but never deploy or run, an Engine pre-start stems candidate.

Input is the current lab launcher. Output must be a new file. This deliberately
refuses unfamiliar launcher structure instead of silently patching it.
"""
import argparse
from pathlib import Path
import subprocess

HOOK = r'''
# Experimental pre-start stems setup. Must run in this launcher's private
# mount namespace, before Engine constructs its processor manager.
stems_probe="$lab/stems-probe-20260911"
stems_archive="$stems_probe/stems-child-process.sqsh.signed"
stems_adapter="$stems_probe/native-adapter"
stems_expected=c0d7cc541eeb254104b8e565fe53c648ffa2df00e1fa15ba545c75347eb82b3c
[ "$(sha256sum "$stems_archive" | cut -d ' ' -f 1)" = "$stems_expected" ] || {
 echo 'Unexpected stems package; Engine not started' >&2; exit 1;
}
for stems_file in stems-processor stems-processor.real libNNPredictionDispatcher_on.so; do
 [ -x "$stems_adapter/$stems_file" ] || {
  echo "Missing processor component: $stems_file" >&2; exit 1;
 }
done
[ -f "$lab/pi-stems-affinity.so" ] || exit 1
[ -f "$lab/pi-stems-directory.so" ] || exit 1
[ -x "$root/opt/pi-graphics/ld-linux-aarch64.so.1" ] || exit 1
[ -d "$root/content" ] && [ -d "$root/secure-media" ] || exit 1
stems_package_target="$root/content/stems-child-process.sqsh.signed"
stems_mount_target="$root/secure-media/stems-child-process.sqsh"
# Reject symlinks so bind targets cannot escape the runtime tree.
for stems_target in "$root/content" "$root/secure-media" "$stems_package_target" "$stems_mount_target" "$root/root/pi-stems-affinity.so" "$root/root/pi-stems-directory.so"; do
 [ ! -L "$stems_target" ] || exit 1
done
# Empty mountpoint files/directories may remain in the lab runtime on exit.
# Archive and executable contents are exposed only through namespace mounts.
if [ ! -e "$stems_package_target" ]; then
 (set -C; : > "$stems_package_target")
fi
[ -f "$stems_package_target" ] || exit 1
mkdir -p "$stems_mount_target"
mount --bind "$stems_archive" "$stems_package_target"
mount -o remount,bind,ro "$stems_package_target"
mount --bind "$stems_adapter" "$stems_mount_target"
mount -o remount,bind,ro "$stems_mount_target"
if [ ! -e "$root/root/pi-stems-affinity.so" ]; then
 (set -C; : > "$root/root/pi-stems-affinity.so")
fi
mount --bind "$lab/pi-stems-affinity.so" "$root/root/pi-stems-affinity.so"
mount -o remount,bind,ro "$root/root/pi-stems-affinity.so"
if [ ! -e "$root/root/pi-stems-directory.so" ]; then
 (set -C; : > "$root/root/pi-stems-directory.so")
fi
mount --bind "$lab/pi-stems-directory.so" "$root/root/pi-stems-directory.so"
mount -o remount,bind,ro "$root/root/pi-stems-directory.so"
echo 'Processor package and adapter mounted before Engine startup'
'''


def generate(source: str) -> str:
    required = ('exec unshare --mount --pid --fork --net --kill-child',
                'mount --make-rprivate /', 'root="$lab/runtime64"')
    if any(item not in source for item in required):
        raise ValueError('Not a recognized isolated lab launcher')
    if source.splitlines().count('set +e') != 1 or source.count('/usr/Engine/Engine -skipFirmwareUpdate -d0') != 1:
        raise ValueError('Ambiguous Engine launch boundary')
    if 'stems_expected=' in source:
        raise ValueError('Pre-start setup already present')
    before, launch = source.split('\nset +e\n')
    if launch.count('LD_PRELOAD=') != 1:
        raise ValueError('Ambiguous Engine preload assignment')
    if '/root/pi-stems-affinity.so' not in launch:
        launch = launch.replace('LD_PRELOAD=', 'LD_PRELOAD=/root/pi-stems-affinity.so:', 1)
    if 'ENGINE_LAB_STEMS_MOUNT=' in source or '/root/pi-stems-directory.so' in source:
        raise ValueError('Directory adapter already configured; review current launcher')
    launch = launch.replace('LD_PRELOAD=',
            'ENGINE_LAB_STEMS_MOUNT=/secure-media/stems-child-process.sqsh '
            'LD_PRELOAD=/root/pi-stems-directory.so:', 1)
    candidate = before + '\n' + HOOK + '\nset +e\n' + launch
    subprocess.run(['sh', '-n'], input=candidate, text=True, check=True)
    return candidate


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('source', type=Path)
    parser.add_argument('output', type=Path)
    args = parser.parse_args()
    candidate = generate(args.source.read_text())
    with args.output.open('x') as output:
        output.write(candidate)
    print(f'Created {args.output}; shell syntax checked; NOT deployed or runtime-tested')


if __name__ == '__main__':
    main()
