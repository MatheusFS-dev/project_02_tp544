# Running full training

Requires Python 3.12, uv, an NVIDIA GPU and a compatible CUDA driver. Run from
the repository root. The original and processed datasets are included in Git.
Do not regenerate or resplit data when comparing cases across computers.

## Environment

```bash
uv sync
source .venv/bin/activate
```

Activate the project environment again in each new terminal.

## Training cases

Run cases sequentially to avoid competing for GPU memory.

| Case | Command | Configuration |
| --- | --- | --- |
| Residual baseline | `python3 src/inverse_design/baseline.py` | `src/configs/baseline.toml` |
| Optuna TPE | `python3 src/inverse_design/optuna_search.py` | `src/configs/optuna.toml` |
| AutoKeras | `python3 src/inverse_design/autokeras_search.py` | `src/configs/autokeras.toml` |
| Ray Tune | `python3 src/inverse_design/ray_search.py` | `src/configs/ray.toml` |

Each configuration selects the full-family processed NPZ, logical `cuda:0`,
50 maximum epochs per candidate and early stopping with patience 8. Searches
have 100 candidates, with one active trial. The baseline runs one model.
Full searches can take substantial time. No full training is launched by setup.

The default is physical GPU 0. On a single-GPU computer, use the commands above.
On the original computer, the RTX 4070 is physical GPU 1. Select it before
framework imports, for example:

```bash
CUDA_VISIBLE_DEVICES=1 python3 src/inverse_design/baseline.py
```

Replace the script path with any case in the table. Check GPU numbering on the
new computer rather than assuming it matches the original machine.

## Progress, logs and recovery

All four entry points mirror stdout and stderr to append-only logs in
`runs/treinar_full/logs/`: baseline.log, optuna.log, autokeras.log and ray.log.
Stage messages, per-batch progress with elapsed time/ETA/throughput, validation
loss and epoch duration remain visible in the terminal. Ray additionally keeps
worker/trial logs within its experiment artifacts.

Checkpoints, configurations and metrics are stored under each case's directory
in `runs/treinar_full/`. Rerun the same command to resume. Completed searches
return their saved result. Use a new output root when changing configuration,
data or split definitions. Do not copy an old manifest over a new experiment.
Runtime artifacts and the virtual environment are excluded from Git.

## Validation

```bash
pytest -q

```

The dataset uses all twelve families, with unique geometries stratified roughly
70/15/15 before split-local minimax label selection. See PROBLEM_ARCHITECTURE.md
for the proposed architecture and docs/reports/full_family_implementation.md for
the earlier short validation results. Full-budget configuration does not imply
that full training has already been performed.

## Baseline figures and five HFSS projects

After baseline training, run:

```bash
python3 src/validation/baseline/baseline_results.py
python3 src/validation/baseline/hfss_cases.py
```

The first command uses the retained baseline dataset and best checkpoint. It saves
figures and a deterministic five-case manifest under `src/validation/baseline/`
and the summary under `src/validation/baseline/baseline_validation.md`. It does not train.
The second requires a local licensed AEDT 2025 R2 installation and graphical
display. It copies the received project, preserves the original simulation
settings, and leaves the desktop open. It saves five separate project files,
solver status, T/R/A spectra and plots, plus `src/validation/baseline/baseline_hfss.md`.
Completed cases are skipped on reruns. Do not edit the checkpoint or dataset
between case preparation and simulation.

To refresh the HFSS report and absorption comparisons from exported spectra
without launching or rerunning the solver:

```bash
python3 src/validation/baseline/hfss_report.py
```

This also reads native solver profiles to distinguish mesh convergence from
frequency-sweep convergence, and compares each prediction with its original
held-out catalogue label. Missing convergence evidence is reported as unknown.

The validated full-training baseline is stored in `results/baseline/`. `metrics.json` contains its training history and validation/test metrics, `best.ckpt` contains the best-validation model, and `training.log` contains the training log. The original `runs/treinar_full/baseline` and baseline-log paths are compatibility symlinks, preserving checkpoint/configuration identity. Validation reports and HFSS artifacts remain in `src/validation/baseline/`.
