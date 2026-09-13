Independent consultation returned successfully by Claude Code using claude-opus-5. This is advice based on the supplied brief, not independently verified findings. In particular, licensing conclusions, deployment restrictions, runtime capabilities, and suggested quality thresholds need separate verification. No model weights or audio were supplied.

# Independent critique: Engine DJ stem model on Pi 5, and BiteDJ integration

**Labels:** **[F]** comes from your evidence. **[H]** is my hypothesis. **[U]** means I am not certain of the external fact. None of this is Pi-measured.

**Boundary to settle first:** The extracted Engine model and its ORT worker are proprietary research material. What you learn from them transfers to BiteDJ: layer sensitivities, runtime behavior, and pipeline structure. The weights and the worker do not. BiteDJ is a GPL Mixxx fork, so a shipping stems feature should use an openly licensed model and your own runtime. That also means speedups inside Engine's embedded ORT 1.16.3 remain research, because you cannot swap its runtime or model bytes.

---

## 1. Top three speed experiments

**Rough ceiling estimate [H]:** If hop is about 1024 with little overlap, 30 s of audio is about 10 inferences, or about 274 GMAC. Doing that in 26 s on 2 threads is about 10 GMAC/s. The FP32 NEON peak for two A76 cores is about 38 GFMA/s, so you are at roughly 25–30% of peak. There is headroom, but not an order of magnitude from FP32 tuning alone.

**Do this first:** Build a per-stage table of MACs and weight bytes. The high-resolution layers (enc1/enc2, dec5/dec6, final) probably dominate MACs and are also the sensitive ones. By Amdahl's law, that caps any FP16 or INT8 gain.

1. **Audit which kernels ORT 1.16.3 ARM actually runs, under QEMU.** This is a correctness check, not a timing test.
   - Enable verbose logging, `optimized_model_filepath` and profiling for the FP16-island and QDQ models.
   - Call `GetAvailableProviders` to see whether XNNPACK or ACL are compiled into the library.
   - **[H]** ORT's InsertCastTransformer may silently rewrite FP16 Convs that lack a CPU kernel as Cast→FP32 Conv→Cast. That would match both your unchanged desktop CPU speed and the slow emulated run. The saved optimized graph will show it.
   - Use QEMU's instruction-count plugin as a crude relative-work proxy.
   - Let the FP16 run finish (raise the timeout). Your GPU islands likely accumulated in FP32. A76 FP16 FMLA accumulates in FP16 **[H]**, so the 0.17–0.37% figure may not transfer.

2. **INT8 with SDOT, on deep layers only, after diagnosing why PTQ fails (§3).**
   - On the A76, SDOT does 16 int8 MACs per 128-bit instruction versus 4 FP32 FMAs. INT8 is therefore the biggest theoretical A76 lever.
   - The desktop 1.10x result doesn't transfer. x86 S8S8 may take slower ORT paths than U8S8 **[U]**.
   - INT8 or FP16 weights also cut the roughly 400 MB of weights streamed per inference and the worker's RSS. The low-resolution center blocks are weight-heavy and may be bandwidth-bound on the Pi **[H]**.

3. **An A76-native runtime for a BiteDJ-owned worker.** Candidates are ncnn (FP16 storage and arithmetic, Winograd 3×3, SDOT int8) or XNNPACK (via TFLite or a newer ORT XNNPACK EP).
   - Use per-layer precision, with FP32 for zmfc/enc1/enc2/final.
   - Validate numerics under QEMU, where instruction semantics are faithful even though timing is not.
   - Measure speed only in a scheduled Pi window.

**Cheap knobs to prepare now and time later on the Pi:**
- intra-op thread count;
- `session.intra_op.allow_spinning=0`;
- chunk overlap ratio;
- whether T can exceed 128. Check whether Reshape constants pin it, and verify numerics first.

## 2. Critique of your tests and hypotheses

**The zmfc sensitivity is plausibly genuine [H].**
- A zero-mean filter makes the output invariant to an additive input offset, which is gain invariance if the input is log-domain.
- FP16 rounding breaks exact zero-sum. The error is about c·Σw_half, where c is the input DC.
- With |w| around 1 and 18 taps, Σ error is about 1e-3. A following BatchNorm with small running variance (because DC was cancelled) then amplifies it.

**Tests that distinguish a real constraint effect from a conversion bug:**
- (a) Check the ReduceMean axes and all 32 per-filter sums. A global sum of about 0 doesn't prove per-filter zero-mean.
- (b) Re-project the rounded weights to zero-sum per filter, or keep the Sub after the Cast. If the error collapses, the constraint explains it.
- (c) Subtract the input mean before the FP16 conv.
- (d) Check that FP32 output is invariant to adding a constant to zmfc's input.
- (e) Log |mean|/std for every Conv input. The sensitive layers should be the ones with high ratios. This may also explain enc1.

**Possible mistakes to rule out:**
- rounding before versus after BatchNorm folding (folded scales can be large);
- FP16 subnormals or overflow in folded biases;
- whether the extracted ONNX is byte-identical to the embedded model (compare hashes);
- the ~16 unlisted ops. Is there a Log/Pow/Div before zmfc?

**The test inputs are a weak basis.** If Engine's real frontend uses different scaling or normalization, both the sensitivities and the calibration ranges shift. A single recording biases calibration.

**Mask relative L2 is the wrong gate.** It overweights bins with no mixture energy. Use a mixture-weighted stem error instead:
- SNR = 10·log10(‖M_ref⊙|X|‖² / ‖(M_c−M_ref)⊙|X|‖²)
- Compute it per stem and per 1 s window, and gate on the worst window.
- Replace the silence mask error with an absolute output-level check.

**Establish a noise floor.** Compare desktop ORT 1.30 FP32 against ARM ORT 1.16.3 FP32 on the same tensor.

**The INT8 relative L2 of 0.9 is abnormal for PTQ on a conv net [H].** Suspect the pipeline:
- input QDQ applied over a range of more than 100 dB;
- BatchNorm left unfolded (a BN→LeakyReLU→Conv order can't fold);
- scale mismatches at Resize, Concat or Add.

## 3. Can quantization be rescued?

**Without retraining, ranked:**
1. **Locate the error.** Try INT8 weights only (per-channel fake-quant, FP32 activations), then an activation-only sweep one layer at a time.
2. **Cross-layer equalization plus bias correction.** LeakyReLU is positively homogeneous, so rescaling channels across conv pairs is exact in FP32. This equalizes ranges.
3. **Percentile or entropy calibration**, but only after you have real frontend tensors from many tracks at varied gains.
4. **AdaRound, AdaQuant or BRECQ layer-wise reconstruction.** These need unlabeled inputs only, a few hundred tensors, not ground-truth stems.
5. **Mixed precision driven by the sweep:** INT8 where it is safe, FP32 elsewhere.

**Per-channel activation quantization** is generally unsupported by integer GEMM kernels. ORT's QLinearConv takes a per-tensor input scale. Cross-layer equalization achieves most of the same effect.

**Requiring training:** QAT, pruning, and distillation into a smaller student. Distillation needs only unlabeled music. Don't use the proprietary model as the teacher for anything BiteDJ ships.

## 4. FP16 and Winograd on the A76

- **FP16 arithmetic:** The A76 doubles its lanes in FP16, but FP16 accumulation increases error. Prefer FP16 storage with FP32 accumulation where the runtime supports it. Whether it supports widening FMLAL is **[U]**.
- **ORT 1.16.3 limits:** It likely has no Winograd on ARM and only limited ARM FP16 Conv coverage **[U]**. Since Engine's runtime and model bytes are embedded and signed, treat Engine-side acceleration as research only.
- **Winograd:** F(2,3) and F(4,3) in FP32 are generally safe. F(6,3), or Winograd in FP16, adds transform error, so keep it off enc1/enc2. It helps only 3×3 stride-1 convs, so check your kernel-shape histogram.
- **Alternatives:** ncnn, XNNPACK, Arm Compute Library, or a newer ORT built with the XNNPACK EP. TVM needs on-device tuning, which is unavailable to you.

## 5. Experiment matrix and gates

**Step 0, the enabler:** Under QEMU, add an LD_PRELOAD shim that wraps `OrtGetApiBase` and the `Run` call. Feed your local excerpt through the official worker and dump its real input and output tensors. That gives you the exact frontend tensors and reference masks.

**Rows:**
- FP32 reference
- FP32 with thread and chunk variants
- deep FP16 with CPU-faithful accumulation
- 127-Conv FP16
- deep INT8 after cross-layer equalization and AdaRound
- alternative-runtime FP32/Winograd

**Columns:**
- QEMU numerics
- kernel dispatch
- instruction count
- RSS
- Pi real-time factor, measured later

**Gates:**

| Stage | Gate |
|---|---|
| Numerics | Worst-window stem SNR vs FP32 ≥ 40 dB on at least 10 diverse tracks. The threshold **[H]** needs calibrating by listening. |
| Numerics | Silence output below −90 dBFS. |
| Memory | RSS ≤ current. |
| Pi, only after numerics pass | Real-time factor at least 1.2x at 2 threads, with zero xruns while two decks play. |
| Listening | Blinded ABX on reconstructed stems: no reliable discrimination over at least 16 trials. |

**Minimum missing information for a genuine audio-quality evaluation:**
- STFT window, n_fft and hop;
- magnitude scaling and normalization;
- chunk overlap and crossfade;
- the 8-channel output mapping to stems and L/R;
- how masks are applied (magnitude, complex, Wiener?);
- the iSTFT;
- a diverse, licensed test set.

---

## 6. Five BiteDJ priorities

1. **Complete Engine import (interoperability data).** Cover cues with their source identity, loops, beatgrids and playlists. Fold EDMC hash identity in here.
   *Evidence needed:* fixture databases across Engine schema versions, and round-trip comparison with what Engine itself shows.
2. **Playback of already-prepared stems.** This is interoperability plus behavior to emulate.
   *Evidence needed:* check upstream Mixxx stem support before writing your own **[U: 2.6 added stem files]**, and inspect Engine's prepared-stem format.
3. **Audio device negotiation hardening (a lesson, not code).**
   *Evidence needed:* log the PortAudio/ALSA capabilities BiteDJ sees on the Pi with the FLX6. Clamp to actual hardware only if a similar bogus report appears.
4. **Browse/load frame gaps (behavior target).**
   *Evidence needed:* measure BiteDJ first. Change nothing unless comparable stalls show up.
5. **Waveform scroll pacing.**
   *Evidence needed:* measure BiteDJ's waveform change rate against vsync at each zoom. The RX3 lesson is to prefer time-based sub-pixel scrolling over integer-pixel steps.

**Remains research only:** firmware QML, the framebuffer presenter, signed archives, the CPU-queue adapter, and the model weights and worker.

## 7. Boundaries, traps and regression measurements

**Component boundaries:**

| Component | Boundary |
|---|---|
| Audio thread | No allocation, locks, I/O or decoding. Stems come from pre-decoded reader buffers. |
| Library/import | Separate thread, batched transactions. It must never hold a SQLite lock the GUI waits on. |
| Waveform/UI | Analysis runs in the analyzer thread; the renderer reads immutable snapshots. |
| Controller mapping | Versioned, with FLX6 semantics as a protected contract. New stem controls go only on unused controls or layers the user approves. |
| EDMC | Separate process. It hands over files by atomic rename plus a manifest (identity, size, hash). It never writes BiteDJ's database. |
| Stems worker | Separate process with SCHED_IDLE or nice 19, a cgroup cpuset/quota and memory cap, and cores discovered via `sched_getaffinity` (the lesson from Engine's CPUs 4–7). Pause it on audio stress. Cache keyed by audio-content hash, model version and parameters. |

**Highest-risk traps:**
- ORT spinning threads starving the real-time audio thread.
- Thermal throttling during generation.
- Memory pressure on 4 GB (historical worker RSS was about 899 MiB).
- Priority inversion through the database.
- Shift-layer collisions in the mapping.
- Cache invalidation when files are only re-tagged.

**Regression measurements:**
- xrun count and audio-callback duration histogram;
- p99 and maximum GUI frame gap during browse/load;
- load-to-play latency;
- scripted FLX6 MIDI replay compared against golden state;
- worker real-time factor with two decks playing;
- throttle flags and temperature;
- RSS.

## 8. Roadmap

Each step is desktop-first and needs one coordinated Pi window at most.

1. **Instrumentation and tests (desktop).**
   - FLX6 replay test and golden state.
   - Metrics hooks.
   - A single agreed Pi baseline window.
2. **Engine import validation (desktop fixtures).**
   - Adds EDMC manifest ingest.
3. **Prepared-stem playback, read-only, behind a flag.**
   - Mapping additions reviewed with the user.
4. **Tracks 1 and 2 of this report (QEMU only).**
   - The Step 0 tensor capture, the kernel-dispatch audit and the cross-layer-equalization INT8 diagnosis from the §5 matrix. This is Engine-model research only.
5. **Stems worker skeleton with an open model.**
   - Isolation, caching and scheduling, validated in QEMU.
   - Then one Pi window measuring xruns and real-time factor.
6. **Frame-pacing and waveform work, only if step 1 shows a problem.**

Never run two Pi experiments at once, and record a fresh baseline in each window.
