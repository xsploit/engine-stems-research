#!/bin/bash
set -euo pipefail
base=/home/pompu_5/engine-pi-lab/stems-opt-probe-20260911
for config in old-2 new-2 old-4 new-4; do
 case "$config" in
  old-2) lib=/home/pompu_5/engine-pi-lab/stems-probe-20260911/libNNPredictionDispatcher_on.so; threads=2;;
  old-4) lib=/home/pompu_5/engine-pi-lab/stems-probe-20260911/libNNPredictionDispatcher_on.so; threads=4;;
  new-4) lib="$base/packages/onnxruntime/capi/libonnxruntime.so.1.30.0"; threads=4;;
  new-2) lib="$base/packages/onnxruntime/capi/libonnxruntime.so.1.30.0"; threads=2;;
  new-1) lib="$base/packages/onnxruntime/capi/libonnxruntime.so.1.30.0"; threads=1;;
  old-1) lib=/home/pompu_5/engine-pi-lab/stems-probe-20260911/libNNPredictionDispatcher_on.so; threads=1;;
 esac
 sudo -n systemd-run --quiet --wait --pipe --collect -p User=pompu_5 -p MemoryMax=1200M -p MemorySwapMax=0 -p CPUQuota=400% -p Nice=15 -p RuntimeMaxSec=90 -p WorkingDirectory="$base" "$base/ort-bench" "$lib" "$threads" 99 "idle-$config-all.f32" > "$base/outputs/idle-$config-all.json"
 cat "$base/outputs/idle-$config-all.json"
done
