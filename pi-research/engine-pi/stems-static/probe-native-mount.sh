#!/bin/bash
set -euo pipefail
pid=${1:?Engine PID required}
archive=${2:?Signed package path required}
rt=/proc/$pid/root
[[ $(cat /proc/$pid/comm) == EMain ]]
[[ -f $archive ]]
expected=c0d7cc541eeb254104b8e565fe53c648ffa2df00e1fa15ba545c75347eb82b3c
actual=$(sha256sum "$archive")
[[ ${actual%% *} == "$expected" ]]
# Clone Engine's mount namespace. The tmpfs mounts cannot affect its namespace.
nsenter -t "$pid" -m -- unshare -m --propagation private bash -s -- "$rt" "$archive" <<'INNER'
set -euo pipefail
source_root=$1
archive=$2
rt=$(mktemp -d /tmp/engine-stems-mount.XXXXXX)
trap 'umount -R "$rt" 2>/dev/null || true; rmdir "$rt" 2>/dev/null || true' EXIT
mount --rbind "$source_root" "$rt"
mount --make-rprivate "$rt"
# Only this disposable clone receives the host device nodes needed by verifier.
mount --rbind /dev "$rt/dev"
mount -t tmpfs -o size=1M tmpfs "$rt/content"
mount -t tmpfs -o size=1M tmpfs "$rt/secure-media"
touch "$rt/content/stems-child-process.sqsh.signed"
mount --bind "$archive" "$rt/content/stems-child-process.sqsh.signed"
set +e
timeout 35 chroot "$rt" /opt/pi-graphics/ld-linux-aarch64.so.1 --library-path /opt/pi-graphics:/usr/lib:/lib /usr/bin/az01-signed-fs /content/stems-child-process.sqsh.signed
rc=$?
set -e
printf 'helper_exit=%s\n' "$rc"
find "$rt/secure-media" -maxdepth 2 -type f -printf '%P %s bytes\n'
# Namespace exit releases mounts; helper uses deferred device-mapper removal.
exit "$rc"
INNER
