Claude Opus 5 follow-up, supplied as advice rather than verified findings. It did not inspect local files or run tools. QEMU timing is not Pi timing, and profiling alone does not establish actual hardware instruction selection.

**Short answer:** A saved optimized graph is useful evidence, but it is not conclusive on its own. Treat it as one of three signals.

## Saving the optimized graph (no Run)

Set `optimized_model_filepath` with the **original 1.16.3 aarch64 library** under QEMU. Run it at two levels: `ORT_ENABLE_BASIC` and `ORT_ENABLE_ALL`. In the saved graph, check:

1. **Cast nodes added by ORT.** Diff them against the original FP16 model. Look for new `Cast` nodes, often with generated names, around specific op types. Casts that surround an op (FP16→FP32, op, FP32→FP16) mean that op had no FP16 kernel.
2. **Element types around each compute node.** Look at the op's inputs and outputs in `value_info` and the initializers. If the heavy ops (Conv, MatMul, Gemm, LSTM, Attention, whatever dominates) stay FP16 with no surrounding casts, that points to native FP16.
3. **Fused and contrib ops.** Check for `com.microsoft` domain ops (FusedConv, NhwcFusedConv, and similar) and layout transposes. Compare which fusions appear in the FP16 graph versus the FP32 graph.
4. **An FP32 baseline saved the same way.** Structural differences beyond the casts show where the optimizer behaved differently.

**Limitations:** The saved ONNX file does not record kernel choice or EP assignment. Also, whether an FP16 kernel exists depends on the library's build flags. It may also depend on which CPU features the emulated CPU reports.

## Cheap additions that make it more reliable

- **Verbose logging:** set session log severity to VERBOSE during session creation. The partitioning and transformer logs show node placement and which transformers changed the graph. This still requires no inference.
- **QEMU CPU model:** use `-cpu` matching the target's features, especially FP16 arithmetic (`asimdhp`/`fphp`). `-cpu max` can expose features the target lacks. Run once with FP16 features on and once with them off. If the graph or logs change, you've shown the decision depends on runtime CPU features. If they don't change, the decision is fixed at build time.
- **Library inspection:** look at the symbols and strings in the original `.so` for MLAS FP16 or half-precision kernel code. This tells you what the build *could* do, not what it did for this model.

## If you allow one synthetic Run

Enable profiling in your harness and run a single inference on synthetic `[1,2,128,2048]` input. The profile JSON lists each node with its op, provider, and input and output types. Inserted Casts show up as timed nodes with their share of runtime. This is the strongest local signal, and it needs no capture. For a numerical check, compare FP16 and FP32 outputs on local audio you already own. The drift pattern also hints at where precision is actually FP16.

## Recommended order

1. Save optimized graphs at BASIC and ALL, for both FP16 and FP32.
2. Add verbose session-creation logs.
3. Repeat with QEMU CPU features toggled.
4. Optionally, run one profiled synthetic inference.

Steps 1–3 together distinguish native FP16 from InsertCast fallback fairly reliably. Step 4 settles remaining ambiguity and measures cost.

## Process

The ownership arrangement is fine: pause the AZ research, and the AZ-named task keeps the BiteDJ production work. Let the PR1 build gate finish before folding any of this in. The graph and profile tools can live in a separate branch, labeled as synthetic-harness evidence rather than capture evidence.
