# Quality comes before further speed tuning

Current status: **BLOCKED / NO CANDIDATE APPROVED**. Previous tensor-proxy comparisons are not output-audio quality validation.

The paired audio comparer, compare-stems.py, takes a JSON manifest of original and candidate stem audio paths. It decodes without gain correction, resampling or alignment, rejects incompatible shapes/sample rates, checks each channel in one-second windows, and exports three-second reference/candidate/difference WAV clips around the worst section. Float WAV clips preserve original levels; the difference is not amplified.

Example manifest:

```json
{"pairs":[{"stem":"vocals","reference":"original-vocals.wav","candidate":"candidate-vocals.wav"}]}
```

Run with a Python environment containing numpy and with ffmpeg/ffprobe installed:

```sh
python compare-stems.py pairs.json comparison-output
```

Its 40 dB active-window SNR and -90 dBFS quiet-window residual-peak limits are provisional engineering screening thresholds, not audibility guarantees. A numerical pass always says PASS_REQUIRES_LISTENING. No gain fitting or automatic time alignment hides differences. Sources must have the same timeline and stem/channel order. A numerical failure means stop and investigate the candidate rather than continue performance tuning blindly.

Validation passed on synthetic tests: identical audio, localized damage to one stereo channel, a one-sample shift, silent identity, added leakage in silence, and unequal lengths. The full decode/report/clip-export path also passed. These tests validate the tool, not any stem model.

## Missing evidence

No saved original-versus-candidate rendered audio pair has been found locally. Prior renderer logs retained frame counts, peaks and energy rather than audio. The exact original processor pipeline currently requires private session material only known on the Pi; it was not retrieved.

The next required step is original and candidate rendering with identical frontend, reconstruction, chunking and settings, locally. Compare each stem over diverse music and quiet/transient sections, listen blind at matched unchanged levels, and reject audible degradation. Original outputs establish fidelity to Engine, not separation accuracy against isolated studio stems. Without those pairs, the speed candidates stay unapproved and further performance tuning is paused.
