> **2026-09-13 update:** Original Engine Desktop worker now ran successfully on this PC. Raw paired audio matches the prototype closely on one 30-second 44.1 kHz stereo input; independent numerical screening passed, listening remains pending. The old no-reference/Pi-session blocker below is superseded for the Windows worker. See [desktop validation](../engine-desktop-validation/README.md).

# HANDOFF: Engine stems pipeline (static research complete, dynamic pending)

## Ready
- PIPELINE-SPEC.md: implementable 44.1 kHz spec for the stems-processor 1.4.0 binary (sha256 3c6f1cb7...):
  Hann(n+1)/(N+1), N=4096, H=1024; pffft (packing/scale source-corroborated); magnitude bins 0..2047 planar [1,2,128,2048];
  mask*|X|; EM gain (eps=FLT_EPSILON, 0.7212); mixture phase; synthesis Nyquist = 0, DC real; 1/N inverse; running w^2 OLA;
  L=3072 compensation; 131072-sample tiled model calls with 3072-sample Hopping history; zero-padded finish; host frames = input frames;
  residual = L-delayed input - sum(stems); output order [stem0 L,R]..[stem3 L,R][res]; highQuality ignored; mono branch.
- Evidence files: fn-*.txt, 10-proc-full.txt, 16-dispatch-table.txt, 19-trim-arithmetic.txt, 20/21 Engine xrefs.

## Known limits
- No runtime equivalence claimed. The NEON divide uses frecpe+2x frecps (not IEEE division), so a PC reimplementation will not be bit-exact.
- pffft layout/scale: source-corroborated assumption. Resampler path not specified.
- Stem identity of indices 0..3: BLOCKED (parent stripped).

## Smallest next dynamic tests (NOT run; require user authorization and the session-gated original processor)
A. Pipeline equivalence: one 44.1 kHz stereo input of T = 131072+130000 frames (exercises one full block plus the two-block finish path, since n > B-L),
   containing a transient, silence and music. Original processor with residual=1, numThreads=1: save the raw 10-channel float output.
   Run the PC reimplementation (same ONNX, FP32) on the same input and compare per-channel: frame count == T, aligned max/RMS diff, Nyquist-bin energy ~0.
   Pass = numerical agreement within float/kernel tolerance, then blind listening per QUALITY-GATE.md.
B. Identity: take one Engine-generated .stems file for a short track (8 channels = 4 stereo pairs). In Engine, solo exactly one UI stem
   (Vocal, then Bass, Melody, Drums), capture the master PCM for the same time window, and correlate it against each channel pair (0,1)(2,3)(4,5)(6,7) of that file.
   Pass = a one-to-one table of UI stem -> processor index s, with a clearly dominant correlation per row.
