#!/usr/bin/env bash
# Local-only ARM optimization. No SSH, network, or deployment.
set -euo pipefail
if [[ $# != 4 ]]; then
  echo "Usage: ARM_CC=/path/to/aarch64-linux-gnu-gcc $0 original.onnx dispatcher.so arm-sysroot output.onnx" >&2
  exit 2
fi
src=$(realpath "$1")
lib=$(realpath "$2")
sysroot=$(realpath "$3")
out=$(realpath -m "$4")
[[ ! -e "$out" ]] || { echo 'Refusing to overwrite existing output.' >&2; exit 2; }
script_dir=$(cd -- "$(dirname -- "$0")" && pwd)
mkdir -p work "$(dirname -- "$out")"
umask 077
build_dir=$(mktemp -d work/arm-model-build.XXXXXX)
trap 'rm -rf -- "$build_dir"' EXIT
"${ARM_CC:-aarch64-linux-gnu-gcc}" -O2 -Wall -Wextra -Werror -I "$script_dir" "$script_dir/optimize-arm-fp32.c" -ldl -o "$build_dir/optimize-arm"
"${QEMU_AARCH64:-qemu-aarch64-static}" -cpu cortex-a76 "$sysroot/usr/lib/ld-linux-aarch64.so.1" --library-path "$sysroot/usr/lib" "$build_dir/optimize-arm" "$lib" "$src" "$out"
chmod 600 "$out"
