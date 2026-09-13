Executed Claude Opus 5 static audit; independently check conclusions against cited disassembly.

I did the static audit with 15 tool calls. Most of the frontend and reconstruction is now pinned down by the binary. I ran nothing: no worker, no inference, no Pi or network access, and I didn't print any weights or session/key values. The full write-up is in `audit/BINARY-EVIDENCE.md`, with the supporting disassembly in `audit/0*.txt`.

Tools: capstone isn't installed in the venv, so I used `llvm-objdump`, `nm`, `readelf` and a few lines of plain Python to read rodata. The processor has symbols but DWARF lookup found no class layouts, so parameter labels come from how values are used, not from member names.

## Confirmed in the binary (`stems-processor` 1.4.0 = zplane Stems-Pro LinuxARM 1.1.0)

| Parameter | Value | Where |
|---|---|---|
| Internal sample rate | 44100.0f; input is resampled only if the host rate differs | ctor `0x10f10`; compare at `0x1365c` |
| FFT size | 4096 | ctor constant (rodata `0x33b70`) → `Fft::prepare` `0x13658` |
| Window | Hann, length 4096 | `WindowGenerator::hann` call `0x14324` |
| Hop | 1024 | rodata `0x33b80` → `Hopping`/`OverlapAddStep::prepare` `0x135d8`/`0x1361c` |
| Chunk | 128 × 1024 = 131,072 samples (≈2.97 s) | multiply at `0x1368c` |
| Shape check | `{1,128,2048,2}` in, `{1,128,2048,2×4=8}` out; throws on mismatch | `0x12fa4`, `0x13250`; assert strings `0x32b70`/`0x32c28` |
| Model source | Embedded in the processor (`Stems_resources`); one warm-up predict runs in `prepare` | `0x12ed4`, `0x13598` |
| Frontend order | Hopping → multiply → FFT → magnitude and phase → tensor, with a rolling frame buffer (`shiftLeftAndInsert`) | `computeInputTensor` `0x15228–0x15468` |
| Reconstruction order | output → multiply → `ephraimMalahApprox` (squares, divides, sqrt) → set magnitude and phase → inverse FFT → overlap-add → add/subtract | `computeOutputTensor` `0x158e0–0x15cb0` |
| Inference call | Plain `OrtApi::Run` (table slot `0x48`), run options NULL; not the IoBinding or async variants | dispatcher `ONNXImpl::predict` `0x43cf30` |
| ORT | 1.16.3 built into the dispatcher; `OrtGetApiBase` reached through the dynamic linker (JUMP_SLOT) | readelf/strings |

This corrects our earlier framing. The raw Sigmoid output is not simply applied as a mask: it goes through Ephraim–Malah-style post-processing before resynthesis. The Hann-4096/hop-1024 guess in `precision-experiments.py` matches the binary, but that script's post-processing does not.

## Still hypotheses, each with the observation that would settle it
- **H1:** the ONNX `[1,2,128,2048]` is zplane's channels-last `{1,128,2048,2}` transposed by the dispatcher. → Disassemble `getModelInputShapeAtIndex` / `rearrangeDataVecToChannelsFirst`.
- **H2:** 128 = frames and 2048 = bins (4096/2; which bin is dropped is unknown). → The index loop at `0x153a0–0x153f8`.
- **H3:** the size-2 axis is stereo magnitudes or magnitude plus phase (both are computed). → Which buffers reach `setRawData` at `0x153f8`.
- **H4:** what the multiply at `0x158e0` multiplies, and the inputs to `ephraimMalahApprox`. This decides whether the output acts as a mask or as a magnitude estimate.
- **H5:** which phase is used for resynthesis. → Arguments to `setMagnitudeAndPhase` at `0x15a00`.
- **H6:** whether the add/subtract after overlap-add builds a residual. A flag byte (params+0x14) enables a second resampler sized (4+1)×block. Whether that flag is `residual` or `highQuality` is unresolved: `StemsPro::initialize(int,float,int,int,bool)` takes only one bool. → `main`'s parameter parsing.
- **H7:** whether `capture-ort.c` can hook this ORT. The call path fits, but its API-version check and the preload interposition haven't been tested.

## Blocker
- Real rendering is still gated by the session challenge/response. Everything above is static evidence only.