# Engine DJ stems — research handoff
Snapshot: 13 September 2026.

**[Download the complete research ZIP, including reference and A/B audio](https://github.com/xsploit/engine-stems-research/releases/tag/research-2026-09-13).**

The repository contains browsable notes, code and measurements. Audio is in the release ZIP; extract that ZIP to follow the relative listening links. MANIFEST.json and INDEX.txt describe the complete ZIP, including those audio files. This repository is private; GitHub access is required.

This archive shares the research, experimental tools and comparison evidence with another researcher. It is not a BiteDJ implementation package or a finished product. No DJ application changes are included.

## Start here

1. **CURRENT-FINDINGS.md** — latest verified results and unresolved questions.
2. **az-research/outputs/claude-stems-team/PIPELINE-SPEC.md** — detailed DSP specification, equations, chunking and latency handling.
3. **az-research/outputs/engine-desktop-validation/README.md** — original-worker capture method and numerical comparisons.
4. **az-research/outputs/dubstep55/README.md** — second musical test and listening excerpts.
5. **az-research/outputs/engine-pc-prototype/render_benchmark.py** and **run-benchmark.sh** — experimental offline reconstruction.
6. **model-research/outputs/precision/QUALITY-GATE.md** and **compare-stems.py** — independent comparison method and tool.

## What is included

- Recovered processing details: analysis window, FFT, tensor layout, masks, postfilter, phase reuse, synthesis, overlap-add, trimming and residual.
- Model graph/architecture analysis, FP32/FP16/INT8 experiments, CPU/GPU measurements and earlier ARM/Pi investigations.
- Original Engine Windows worker versus reconstructed output comparisons, hashes, exact frame counts and error measurements.
- Full 30-second candidate and reference stem WAVs, and short A/B/difference listening examples including the later Kromestar test.
- Research scripts, symbol/disassembly excerpts and source-address evidence behind the conclusions.
- Earlier findings retained as history, including failed or inconclusive experiments.

## Reading older notes

CURRENT-FINDINGS.md and the newer desktop/dubstep validation take precedence over earlier claims that no original-worker reference was available. Older static handoffs marked "dynamic pending" reflect their date, not the final state. Historical notes and scripts are otherwise preserved byte-for-byte. Some scripts/JSON manifests contain the original research machine's absolute paths. Those are provenance, not paths that will exist on your machine; adapt them before running archival probes.

Benchmark-only model calls, complete offline audio rendering, and live playback are different measurements. Do not interpret PC render speed as a Pi benchmark or real-time input latency. Do not treat numerical correspondence as proof of separation quality on all music.

## Running the portable reconstruction

Requires a Linux Python environment with NumPy and ONNX Runtime, and a separately supplied compatible ONNX model. Tested versions are listed in requirements-tested.txt. FFmpeg is needed to prepare source audio.

From the extracted archive root:

```sh
ffmpeg -i YOUR_TRACK -ar 44100 -ac 2 -f f32le input.f32
PYTHON=/path/to/python bash az-research/outputs/engine-pc-prototype/run-benchmark.sh   /path/to/model.private.onnx input.f32 4 ./fresh-render-output
```

Use a fresh output directory. Input is raw interleaved stereo float32 little-endian at 44.1 kHz; raw files carry no sample-rate metadata. The renderer uses Python's Unix resource module and is not a native Windows tool. It does not install dependencies. The bundled original-worker capture tools are historical lab tools, not a turnkey capture installer.

## Not included

The private ONNX model/weights, original processor binaries, firmware images, Windows installer, private session/protocol captures, credentials, virtual environments and system dependencies are not bundled. Model identity/hash is documented; the ZIP alone cannot perform inference without the model. The included music excerpts are research listening material, not a music distribution library.

MANIFEST.json identifies every file's size and SHA-256; INDEX.txt lists the archive contents. This package contains no scheduled tasks and nothing runs on extraction.
