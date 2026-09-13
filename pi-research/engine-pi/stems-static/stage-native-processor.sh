#!/bin/bash
set -euo pipefail
pid=${1:?Engine PID required}
lab=/home/pompu_5/engine-pi-lab
rt=$lab/runtime64
probe=$lab/stems-probe-20260911
[[ $(cat /proc/$pid/comm) == EMain ]]
[[ $(readlink /proc/$pid/root) == "$rt" ]]
[[ ! -e $rt/content/stems-child-process.sqsh.signed ]]
[[ ! -e $rt/secure-media/stems-child-process.sqsh ]]
# Verified original archive; hard-link avoids another 393MiB copy.
ln "$probe/stems-child-process.sqsh.signed" "$rt/content/stems-child-process.sqsh.signed"
mkdir "$rt/secure-media/stems-child-process.sqsh"
if ! nsenter -t "$pid" -m -- mount --bind "$probe/native-adapter" "$rt/secure-media/stems-child-process.sqsh"; then
 rmdir "$rt/secure-media/stems-child-process.sqsh"
 rm "$rt/content/stems-child-process.sqsh.signed"
 exit 1
fi
nsenter -t "$pid" -m -- mount -o remount,bind,ro "$rt/secure-media/stems-child-process.sqsh"
printf 'Staged processor for Engine PID %s; no restart performed\n' "$pid"
