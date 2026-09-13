#!/usr/bin/env bash
set -euo pipefail
# Run manually on the target machine; this never connects to a Pi.
# Usage: PYTHON=/path/to/venv/bin/python ./run-benchmark.sh MODEL INPUT_F32 THREADS OUTPUT_DIR
if [ "$#" -ne 4 ]; then
  echo 'Usage: run-benchmark.sh MODEL_ONNX INPUT_STEREO_44100_F32 THREADS OUTPUT_DIR' >&2
  exit 2
fi
script_dir=$(cd -- "$(dirname -- "$0")" && pwd)
python_bin=${PYTHON:-python3}
"$python_bin" "$script_dir/render_benchmark.py" --self-test --output "$4/checks"
"$python_bin" "$script_dir/render_benchmark.py" --model "$1" --input-f32 "$2" --channels 2 --threads "$3" --output "$4"
