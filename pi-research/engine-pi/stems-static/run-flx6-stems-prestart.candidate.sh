#!/bin/sh
# Quiet logging comparison candidate; warnings/errors and frame timing remain.
# Interactive session: no test time limit. Stop the Engine process with SIGTERM.
# Run via sudo. Only mounts inside a new private namespace; no host devices.
set -eu
lab=/home/pompu_5/engine-pi-lab
if [ "${1:-}" != --inside ]; then
 exec unshare --mount --pid --fork --net --kill-child "$0" --inside
fi
mount --make-rprivate /
# Internal Engine clients need localhost; this network namespace has no uplink.
/usr/bin/python3 - <<'PY_LOOPBACK'
import socket,fcntl,struct
s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
r=fcntl.ioctl(s,0x8913,struct.pack('16sH14x',b'lo',0))
flags=struct.unpack_from('H',r,16)[0]
fcntl.ioctl(s,0x8914,struct.pack('16sH14x',b'lo',flags|1))
print('Private loopback enabled',flush=True)
PY_LOOPBACK
root="$lab/runtime64"
touch "$root/root/pi-panel-rotation"
mount --bind "$lab/pi-panel-rotation" "$root/root/pi-panel-rotation"
mount -o remount,bind,ro "$root/root/pi-panel-rotation"
mkdir -p "$root/opt/pi-graphics"
mount --bind "$lab/pi-graphics" "$root/opt/pi-graphics"
mount -o remount,bind,ro "$root/opt/pi-graphics"
mkdir -p "$root/proc" "$root/dev" "$root/sys" "$root/tmp" "$root/run" "$root/data"
mount -t proc proc "$root/proc"
mount --bind "$lab/fixture-irq" "$root/proc/irq"
mount -o remount,ro "$root/proc"
mount -t tmpfs tmpfs "$root/dev"
for name in null zero urandom random; do
 touch "$root/dev/$name"
 mount --bind "/dev/$name" "$root/dev/$name"
done
# Resolve the user's stable FLX6 card ID; expose only its output and sequencer.
card_index=
for entry in /proc/asound/card*/id; do
 if [ "$(cat "$entry")" = DDJFLX6 ]; then
  card_path=${entry%/id}; card_index=${card_path##*card}
 fi
done
[ -n "$card_index" ] || { echo 'FLX6 is absent'; exit 1; }
mkdir -p "$root/dev/snd"
for node in "controlC$card_index" "pcmC${card_index}D0p" seq; do
 touch "$root/dev/snd/$node"
 mount --bind "/dev/snd/$node" "$root/dev/snd/$node"
done
touch_node=$(readlink -f /dev/input/by-path/platform-1f00080000.i2c-event)
[ -c "$touch_node" ] || exit 1
mkdir -p "$root/dev/input"
touch "$root/dev/input/${touch_node##*/}"
mount --bind "$touch_node" "$root/dev/input/${touch_node##*/}"
ln -s "${touch_node##*/}" "$root/dev/input/pi-touch"
mkdir -p "$root/dev/dri"
touch "$root/dev/dri/renderD128"
mount --bind /dev/dri/renderD128 "$root/dev/dri/renderD128"
touch "$root/dev/dri/card0"
mount --bind /dev/dri/card0 "$root/dev/dri/card0"
mount --bind "$lab/screen-touch-pi.json" "$root/usr/Engine/ScreenConfiguration/RMZ2/ScreenConfiguration.json"
mount -o remount,bind,ro "$root/usr/Engine/ScreenConfiguration/RMZ2/ScreenConfiguration.json"
mount --bind /sys "$root/sys"
mount -o remount,bind,ro "$root/sys"
mkdir -p "$root/sys/devices/system/cpu"
mount --bind /sys/devices/system/cpu "$root/sys/devices/system/cpu"
mount -o remount,bind,ro "$root/sys/devices/system/cpu"
mount --bind "$lab/libqminimal-1280x800.so" "$root/usr/lib/plugins/platforms/libqminimal.so"
mount -o remount,bind,ro "$root/usr/lib/plugins/platforms/libqminimal.so"
mount -t tmpfs tmpfs "$root/tmp"
mount -t tmpfs tmpfs "$root/run"
mkdir -p "$lab/state"
mount --bind "$lab/state" "$root/data"
mkdir -p "$root/media/ENGINE_LAB"
mount -o loop,nosuid,nodev,noexec "$lab/media-edmc88.img" "$root/media/ENGINE_LAB"
mkdir -p "$root/media/ENGINE_LAB/Music"
cp -n "$lab/test-media/Music/Estara.mp3" "$root/media/ENGINE_LAB/Music/Estara.mp3"
mkdir -p "$root/run/dbus"
cat > "$root/tmp/lab-dbus.conf" <<'DBUS'
<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus Configuration 1.0//EN" "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
<busconfig>
 <type>system</type>
 <listen>unix:path=/run/dbus/system_bus_socket</listen>
 <auth>EXTERNAL</auth>
 <policy context="default">
  <allow user="root"/>
  <allow own="*"/>
  <allow send_destination="*"/>
  <allow receive_sender="*"/>
 </policy>
</busconfig>
DBUS
mkdir -p "$root/capture"
mount -t tmpfs -o size=256m tmpfs "$root/capture"
touch "$root/root/lab-input.so"
mount --bind "$lab/lab-input-qt-nav.so" "$root/root/lab-input.so"
mount -o remount,bind,ro "$root/root/lab-input.so"
for item in native-frame.so alsashim.so midisurface lab-egl.so pcm-trace.so arm-ftz.so pcm-channels.so; do
 touch "$root/root/$item"
 mount --bind "$lab/$item" "$root/root/$item"
 mount -o remount,bind,ro "$root/root/$item"
done
/usr/bin/python3 "$lab/capture-ring.py" "$root/capture" &
/usr/bin/python3 "$lab/lab-log.py" "$root" > "$lab/journal.log" 2>&1 &
ulimit -c 0
# Enter the lab before dropping DAC override (the home directory is private).
cd "$root"
# A private bus without any activation directories or host bus access.
setpriv --bounding-set=-all,+sys_chroot \
 /usr/sbin/chroot . /usr/bin/dbus-daemon --config-file=/tmp/lab-dbus.conf --fork
# Advertise only the copied lab directory on the private bus.
cd "$lab"
setpriv --bounding-set=-all /usr/bin/python3 - \
 "unix:path=runtime64/run/dbus/system_bus_socket" ./runtime64/media/ENGINE_LAB \
 < "$lab/directory-source.py" > "$lab/directory-source.log" 2>&1 &
source_pid=$!
tries=0
while ! grep -q 'Directory source ready' "$lab/directory-source.log"; do
 kill -0 "$source_pid" || { cat "$lab/directory-source.log"; exit 1; }
 tries=$((tries+1)); [ "$tries" -lt 30 ] || exit 1
 sleep .1
done
cd "$root"
# Matching host interpreter only inside this mount namespace, after helpers start.
mount --bind "$lab/pi-graphics/ld-linux-aarch64.so.1" "$root/lib/ld-linux-aarch64.so.1"
mount -o remount,bind,ro "$root/lib/ld-linux-aarch64.so.1"
mount --bind "$lab/RMZ2_FLX6_Navigation.qml" "$root/usr/Engine/AssignmentFiles/PresetAssignmentFiles/RMZ2/RMZ2_Controller_Assignments.qml"
mount -o remount,bind,ro "$root/usr/Engine/AssignmentFiles/PresetAssignmentFiles/RMZ2/RMZ2_Controller_Assignments.qml"
mount --bind "$lab/midisurface-flx6" "$root/root/midisurface"
mount -o remount,bind,ro "$root/root/midisurface"
# Forward only the explicitly implemented physical FLX6 navigation controls.
mkfifo "$root/tmp/engine-midi"
exec 8<>"$root/tmp/engine-midi"
setpriv --bounding-set=-all,+sys_chroot /usr/sbin/chroot . /opt/pi-graphics/ld-linux-aarch64.so.1 --library-path /opt/pi-graphics:/usr/lib:/lib /usr/bin/env -i \
 PATH=/usr/bin:/bin LD_LIBRARY_PATH=/opt/pi-graphics:/usr/lib:/lib LD_PRELOAD=/root/dtshim.so /root/midisurface --motor-off --flx6-navigation \
 <&8 > "$lab/midisurface.log" 2>&1 &
# Engine receives FLX6 output only plus ALSA MIDI for the virtual surface.

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
[ -x "$root/opt/pi-graphics/ld-linux-aarch64.so.1" ] || exit 1
[ -d "$root/content" ] && [ -d "$root/secure-media" ] || exit 1
stems_package_target="$root/content/stems-child-process.sqsh.signed"
stems_mount_target="$root/secure-media/stems-child-process.sqsh"
# Reject symlinks so bind targets cannot escape the runtime tree.
for stems_target in "$root/content" "$root/secure-media" "$stems_package_target" "$stems_mount_target" "$root/root/pi-stems-affinity.so"; do
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
echo 'Processor package and adapter mounted before Engine startup'

set +e
timeout --signal=TERM --kill-after=3 0 \
 setpriv --bounding-set=-all,+sys_chroot,+sys_nice,+ipc_lock \
 /usr/sbin/chroot . /opt/pi-graphics/ld-linux-aarch64.so.1 --library-path /opt/pi-graphics:/usr/lib:/lib /usr/bin/env -i \
 PATH=/usr/bin:/bin HOME=/tmp LANG=C.UTF-8 \
 ENGINE_LAB_INPUT=1 ENGINE_LAB_NATIVE_CAPTURE=1 ENGINE_LAB_PLAYBACK_CHANNELS=4 ALSASHIM_CARD="$card_index" ALSASHIM_MIDI_CARD="$card_index" ALSASHIM_BUFFER_SCALE=8 LD_PRELOAD=/root/pi-stems-affinity.so:/root/dtshim.so:/root/lab-input.so:/root/alsashim.so:/root/native-frame.so:/root/arm-ftz.so:/root/pcm-channels.so QT_QPA_PLATFORM=eglfs QT_QPA_EGLFS_INTEGRATION=eglfs_kms QT_QPA_EGLFS_FB=/dev/null QT_QPA_EGLFS_WIDTH=1280 QT_QPA_EGLFS_HEIGHT=800 QT_QPA_EGLFS_NO_LIBINPUT=1 QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/pi-touch QT_QPA_EGLFS_HIDECURSOR=1 __EGL_VENDOR_LIBRARY_FILENAMES=/opt/pi-graphics/50_mesa.json LIBGL_DRIVERS_PATH=/opt/pi-graphics GBM_BACKENDS_PATH=/opt/pi-graphics \
 QSG_RHI_BACKEND=opengl QSG_RENDER_LOOP=threaded XDG_RUNTIME_DIR=/tmp QT_LOGGING_RULES="*.debug=false;air.*.info=false" \
 LD_LIBRARY_PATH=/opt/pi-graphics:/usr/lib:/lib /usr/Engine/Engine -skipFirmwareUpdate -d0
result=$?
if [ -f "$root/tmp/ScreenConfig.json" ]; then cp "$root/tmp/ScreenConfig.json" "$lab/screen-generated.json"; fi
if [ -f "$root/capture/qt-grab.png" ]; then cp "$root/capture/qt-grab.png" "$lab/kms-grab.png"; fi
if [ -f "$root/capture/egl-frame.rgba" ]; then cp "$root/capture/egl-frame.rgba" "$lab/egl-frame.rgba"; fi
ls -lt "$root"/capture > "$lab/minimal-capture-list.txt"
latest=$(ls -t "$root"/capture/output*.png 2>/dev/null | head -n 1)
if [ -n "$latest" ]; then cp "$latest" "$lab/engine-minimal.png"; fi
exit "$result"
