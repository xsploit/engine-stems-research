#!/usr/bin/env python3
"""Build and check the directory adapter locally; never connects to a Pi.

Requires an existing Zig toolchain, ARM64 Qt 6 development headers no newer
than the firmware Qt, qemu-aarch64-static, and a preserved firmware runtime.
Only synthetic temporary files are used by the probe.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--runtime', type=Path, required=True)
    ap.add_argument('--zig', type=Path, required=True)
    ap.add_argument('--qt-headers', type=Path, required=True)
    ap.add_argument('--qemu', default='/usr/bin/qemu-aarch64-static')
    ap.add_argument('--result', type=Path, required=True)
    args = ap.parse_args()
    source = Path(__file__).resolve().parent
    runtime = args.runtime.resolve()
    core = runtime / 'usr/lib/libQt6Core.so.6.7.2'
    loader = runtime / 'lib/ld-linux-aarch64.so.1'
    headers = args.qt_headers.resolve()
    for path in (core, loader, args.zig, headers / 'QtCore/qdir.h'):
        if not path.is_file():
            ap.error(f'Missing required input: {path}')
    with tempfile.TemporaryDirectory(prefix='engine-directory-arm64-') as tmp:
        out = Path(tmp)
        common = [str(args.zig.resolve()), 'c++', '-target', 'aarch64-linux-gnu.2.35',
                  '-std=c++17', '-fPIC', '-O2', '-Wall', '-Wextra', '-Werror',
                  '-I' + str(headers), '-I' + str(headers / 'QtCore')]
        shim = out / 'pi-stems-directory.so'
        probe = out / 'directory-adapter-probe'
        subprocess.run(common + ['-shared', str(source / 'pi-stems-directory.cpp'),
                       str(core), '-ldl', '-o', str(shim)], check=True, timeout=180)
        subprocess.run(common + [str(source / 'directory-adapter-probe.cpp'), str(core),
                       '-Wl,--allow-shlib-undefined', '-o', str(probe)],
                       check=True, timeout=180)
        command = [args.qemu, str(loader), '--library-path',
                   str(runtime / 'usr/lib') + ':' + str(runtime / 'lib'),
                   '--preload', str(shim), str(probe)]
        run = subprocess.run(command, text=True, capture_output=True, timeout=45)
        result = {
            'scope': 'ARM64 directory adapter under local emulation; no Engine or Pi run',
            'firmware_qt_sha256': hashlib.sha256(core.read_bytes()).hexdigest(),
            'source_sha256': {name: hashlib.sha256((source / name).read_bytes()).hexdigest()
                              for name in ('pi-stems-directory.cpp', 'directory-adapter-probe.cpp')},
            'exit_code': run.returncode, 'stdout': run.stdout, 'stderr': run.stderr,
        }
        args.result.write_text(json.dumps(result, indent=2) + '\n')
        print(run.stdout, end='')
        print(run.stderr, end='')
        raise SystemExit(run.returncode)


if __name__ == '__main__':
    main()
