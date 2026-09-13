#!/bin/bash
set -euo pipefail
base=/home/pompu_5/engine-pi-lab/stems-opt-probe-20260911
for config in new-2 new-1 old-1; do
 case "$config" in
  new-2) lib="$base/packages/onnxruntime/capi/libonnxruntime.so.1.30.0"; threads=2;;
  new-1) lib="$base/packages/onnxruntime/capi/libonnxruntime.so.1.30.0"; threads=1;;
  old-1) lib=/home/pompu_5/engine-pi-lab/stems-probe-20260911/libNNPredictionDispatcher_on.so; threads=1;;
 esac
 sudo -n systemd-run --quiet --wait --pipe --collect -p User=pompu_5 -p MemoryMax=1200M -p MemorySwapMax=0 -p CPUQuota=200% -p Nice=15 -p RuntimeMaxSec=90 -p WorkingDirectory="$base" "$base/ort-bench" "$lib" "$threads" 99 "$config-all.f32" > "$base/outputs/$config-all.json"
 cat "$base/outputs/$config-all.json"
done
