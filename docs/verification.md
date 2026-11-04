# Implementation verification

## Current checks (2026-11-04)

- Plain `uv sync` installed the shared environment successfully.
- All 25 tests passed, including automatic complete TOMLs, relative data paths,
  missing-file rejection, arbitrary sample counts, split validation, data
  fingerprints, and the existing training/search recovery checks.
- Source compilation and local Markdown links passed validation.
- Baseline, Optuna, AutoKeras, and Ray command-line entry points each completed
  a one-epoch run on `cuda:0` from an explicitly prepared temporary NPZ file.
  Search runs used one candidate and exported their winner artifacts.
- Full search budgets were not exercised. Temporary datasets and run artifacts
  were removed. No example NPZ was generated in the repository.

Current validation commands are in the root [README](../README.md#validation).

The earlier command-line smoke checks used the then-supported positional TOML
override. That override has since been removed. Regression tests verify that
configuration loading is independent of command-line arguments.

## Historical checks (2026-11-03)

Verified on 2026-11-03 using Python 3.12.3 and CPU execution with the locked
environment with all optional dependencies installed. Full 100-candidate searches were not run.

## Automated checks

Current validation commands are in the root [README](../README.md#validation).
The results below are historical, before file-backed input, automatic TOML loading, and the environment and GPU
defaults changed.

The test suite passed all 17 tests. Coverage includes:

- Exact synthetic reproducibility, eight balanced class pairs, zero inner ratio
  for solids, and disjoint shared 280/60/60 splits.
- Input shape, finite values and bounds, including out-of-domain values close
  enough to round to an endpoint in float32.
- Output shapes, finite gradients, exact endpoint decoding and model loading.
- Successful overfit of eight examples representing all class combinations
  within 50 optimizer updates.
- Best-model serialization and repeated completed-run behavior.
- Exact CPU recovery of model weights, optimizer steps, RNG, history and
  early-stopping state, including corrupted-newest-checkpoint fallback.
- Configuration mismatch rejection, invalid-checkpoint rejection and exclusive
  run ownership.
- Dense and residual Keras-to-PyTorch numerical equivalence and exact AutoKeras
  optimizer/model/RNG recovery with dropout and nonzero patience counters.
- Optuna sampler journal recovery after each of the four SQLite parameter
  commits, including the model-based TPE phase and subsequent-trial agreement.
- Completion markers withheld until every winner artifact is exported.
- Ray partial-result rejection and replacement of newer unreported local files
  by the registered scheduler checkpoint.
- Baseline imports without loading any optional search framework.

## Real execution checks

Temporary subprocess checks exercised the actual module entry points and
installed frameworks, rather than framework doubles.

| Runner | Budget exercised | Result |
| --- | --- | --- |
| Baseline | 400-example dataset, 50-epoch maximum | Early stopped at epoch 33 |
| Optuna TPE | Two candidates, two epochs each | Study persisted and winner exported |
| AutoKeras AutoModel | Two candidates, two epochs each | Residual and dense candidates trained, winner exported |
| Ray Tune + ASHA | Two candidates, 12-epoch maximum | Experiment interrupted and restored, budget completed |

The baseline's held-out synthetic test metrics were geometry accuracy 1.0,
substrate accuracy 1.0, joint accuracy 1.0 and combined decoded dimensional MAE
8.672918 nm. These metrics describe this deliberately learnable synthetic task.
They provide no evidence of physical absorption accuracy or feasibility.

Baseline, Optuna and AutoKeras subprocesses were killed after a durable first
epoch and restarted with the same command. They restored epoch 1, optimizer
step 9 and patience counter 0. The search trial identities were preserved.
Additional automated recovery checks saved nonzero patience counters and
verified exact final state agreement with uninterrupted CPU execution.

Ray received SIGINT after its first registered checkpoint. The interrupted
command retained the experiment without publishing a winner. Restart restored
the original trial at epoch 1, optimizer step 9 and patience counter 0, then
completed the candidate budget. Repeating completed baseline and search
commands created no additional candidate checkpoints.

The exported native AutoKeras `best.keras` was loaded and compared numerically
with its portable PyTorch `best.ckpt`. Both dense and residual conversion paths
also have automated numerical checks.

Temporary verification scripts, run outputs, checkpoints, logs and test caches
were removed after verification. The dependency environment remains available.
GPU execution and full 100-candidate search budgets were not acceptance-tested.
