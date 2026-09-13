Claude Opus 5 follow-up to Codex objections; advice, not executed verification.

## Accepted corrections

- **Parameter count:** You're right, and I withdraw the claim. At about 667k elements per conv on average, wide convolutions alone (3×3, 512→512 is roughly 2.36M) account for 102M. Nothing implies a dense projection.
- **Filterbank:** Agreed. Even a `128×2048` constant is not a unique fingerprint: cropping, padding, Nyquist handling, or trainable weights break any n_fft or sample-rate inference. At most it makes axis 3 = frequency more likely.
- **Probes:** Withdrawn. Probe C cannot establish ordering without semantic references, and support or sum patterns are hints, not verdicts.
- **Session challenge/response:** I make no inference about provenance or entitlement. It remains a blocker.

## The one experiment: static graph/metadata audit (no inference)

Read the ONNX file only and record these items, with no weights exported:

1. Graph input/output names, `doc_string`, `metadata_props`, `producer_name`/version.
2. Every consumer of the graph input tensor, and every op between the final conv and the output: Sigmoid, Mul, Concat, Reshape, Split.
3. Any ops applied to the input before the first conv: Log, Pow, Div, Sub, Abs, BatchNorm.
4. The initializer inventory: name, shape, dtype, consuming op type. Plus the values of any Reshape, Slice or Pad shape constants.

**Stop criterion:** the report is written. No follow-on probing and no new frontend built from it.

## Claims that remain hypotheses

| Hypothesis | Observation that could resolve it |
|---|---|
| H1: axis 2 = time, axis 3 = frequency (or the reverse) | Processor binary: the dimension constants passed to tensor creation and the loop that fills them. Graph names can only corroborate. |
| H2: axis 1 = stereo L/R | Graph input name or metadata; otherwise how the processor fills channel 0 vs 1. |
| H3: outputs are masks applied outside the graph | Audit item 2. If the graph input feeds a late Mul, masking is in-graph. If not, it happens in the processor (unresolved statically). |
| H4: 8 = 4 stems × 2 channels, in a specific order | Output name or metadata only if explicit. Otherwise it stays a hypothesis; binary string order is not proof. |
| H5: Hann-4096 / hop-1024 frontend | Processor FFT/window setup code. An isolated `4096` immediate is not proof. |
| H6: inference goes through `OrtApi.Run` | Not visible in the import table, since ORT calls go through a function-pointer table from `OrtGetApiBase`. It needs the call-site offset into `OrtApi` in the processor disassembly. |
| H7: input normalization is outside the graph | Audit item 3 settles the in-graph half. |

## What the audit can and cannot settle

- **Exactly:** H3 in-graph vs. not, H7 in-graph vs. not.
- **Possibly, if the metadata or names are explicit:** H2 and H4.
- **Only through the processor binary:** H1, H5, H6. That is the exact-pipeline path, and the session blocker doesn't prevent static reading of it.