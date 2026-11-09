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

## Flat absorption matching: four independent cases

The `src/flat/` workflow predicts complete spectra from geometry, then minimizes
worst absorption-target error throughout your requested wavelength band.
Baseline, Optuna, AutoKeras and Ray are independent cases. Each trains and exports
one final model. No case selects, trains or loads another case's model.

Prepare the shared received data once:

```bash
python3 src/flat/prepare.py
```

Then run whichever cases you want, sequentially to avoid competing for GPU memory:

| Case | Train its final model | Design using only that final model |
| --- | --- | --- |
| Baseline | `python3 src/flat/cases/baseline/train.py` | `python3 src/flat/cases/baseline/optimize.py` |
| Optuna | `python3 src/flat/cases/optuna/train.py` | `python3 src/flat/cases/optuna/optimize.py` |
| AutoKeras | `python3 src/flat/cases/autokeras/train.py` | `python3 src/flat/cases/autokeras/optimize.py` |
| Ray | `python3 src/flat/cases/ray/train.py` | `python3 src/flat/cases/ray/optimize.py` |

Each case reads its own complete `src/configs/flat_<case>.toml`. The fixed
baseline uses a residual trunk. The three architecture searches explore plain
and residual trunks, widths 128/256/512, depths 2–5 and dropout 0/0.1/0.2.
AutoKeras trains an AutoModel graph, then verifies an equivalent PyTorch export
for gradient-based design. Every final model uses the same loadable checkpoint
format, so each case's design command operates independently.

The data contain all 2,000 source spectra, grouped into 1,926 unique geometries
with complete source provenance. Family-stratified 70/15/15 partitions contain
1,348 training, 289 validation and 289 test geometries. Full configurations use
all partition rows, up to 300 epochs, patience 30 and batch size 64. Each search
has 100 candidates and selects its own final model by validation spectrum loss.
Only the selected model is evaluated on held-out test spectra.

Each case saves:

- Final model: `runs/flat/<case>/final/best.ckpt`.
- Final metrics and configuration: `runs/flat/<case>/final/metrics.json` and `config.json`.
- Resumable training/trial state: `runs/flat/<case>/`.
- Append-only progress logs: `runs/flat/<case>/logs/train.log` and `optimize.log`.
- Geometry designs and predicted spectra: `runs/flat/<case>/designs/<request-id>/`.

Run the same training command again to resume. Epoch checkpoints preserve
optimizer, random generators and early-stopping state. Dataset/config changes
are rejected for an existing run, so use a new output root for a new experiment.
Training prints batch ETA/throughput and epoch losses with duration.

Each case's `optimize.py` loads only its own final model. It asks three questions:
band start in nm, band end in nm, and desired absorption in percent. For example,
enter `600`, `900`, `50` to seek 50% absorption throughout 600–900 nm. There is no
method-selection prompt. The common numerical optimizer is a library helper,
not a shared executable that chooses between models.

Optimization searches F01–F12 with eight training-only starts per family and
500 steps. Parameters stay within training-only bounds and local 10% trust
regions, with positive ring holes. Results include ranked geometries, parameter
bounds, training seed IDs and complete predicted spectra. The default tolerance
is ±5 percentage points everywhere in the band. Results are surrogate
predictions requiring HFSS verification. The best observed training-catalogue
spectrum is reported separately. The available wavelength domain is approximately
450.004–1599.746 nm.

Minimal baseline workflow from the repository root:

```bash
uv sync
source .venv/bin/activate
python3 src/flat/prepare.py
python3 src/flat/cases/baseline/train.py
python3 src/flat/cases/baseline/optimize.py
```

GPU 0 is the default. On this PC, select the RTX 4070 before running commands
with `export CUDA_VISIBLE_DEVICES=1`. TOMLs stay on logical `cuda:0`. No runner
silently substitutes CPU execution.

Short verification of all four cases:

```bash
python3 src/flat/smoke.py
```

This validates all real source data, trains 120 geometries for two epochs, and
evaluates 36 validation/test geometries covering all families. It checks baseline
resume, two actual trials for each search, four independent final models,
AutoKeras export parity, and twelve-family design for each case. Temporary smoke
checkpoints and logs are removed. Report: `src/validation/flat/smoke/smoke.md`.
Smoke metrics are not full-training or physical HFSS results.

Architecture reference: [docs/flat_architecture.md](docs/flat_architecture.md).

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

Optuna best-trial validation (reads `results/optuna/complete.json` and validates only the selected winner):

```bash
python3 src/validation/optuna/optuna_results.py
python3 src/validation/optuna/hfss_cases.py
python3 src/validation/optuna/hfss_report.py
```

Reports, figures, projects and logs are under `src/validation/optuna/`.

Ray best-trial validation (reads `results/ray/complete.json` and validates only the selected winner):

```bash
python3 src/validation/ray/ray_results.py
python3 src/validation/ray/hfss_cases.py
python3 src/validation/ray/hfss_report.py
```

Reports, figures, projects and logs are under `src/validation/ray/`.

Bandwidth analysis of retained test requests and existing HFSS spectra:

```bash
python3 src/validation/baseline/bandwidth_analysis.py
python3 src/validation/optuna/bandwidth_analysis.py
python3 src/validation/ray/bandwidth_analysis.py
```

Each command saves `bandwidth_analysis.md`, numerical tables and plots inside its case directory. It performs no retraining or new HFSS solves.

## Trained flat baseline validation

The completed flat baseline is retained in `results/flat/baseline/`, including
`final/best.ckpt`, metrics, training state/logs and a checksummed dataset snapshot.
`runs/flat/baseline` is a compatibility symlink, so its independent training and
design commands keep working without changing configuration fingerprints.

```bash
python3 src/validation/flat/baseline/baseline_results.py
python3 src/validation/flat/baseline/hfss_cases.py
python3 src/validation/flat/baseline/hfss_report.py
```

All scripts, logs, plots, reports, optimized candidates and five AEDT projects
are under `src/validation/flat/baseline/`. The first command verifies all 289
held-out spectra and optimizes the same five targets used by the earlier inverse
baseline. The second performs actual GUI HFSS simulations. The third refreshes
the physical comparison report without rerunning the solver. Existing optimized
cases and completed simulations are reused after their provenance is checked.

Ray recovery note: mutable training checkpoints are kept outside the asynchronous experiment artifact tree under `runs/flat/ray/training/<trial-id>/`. This avoids checkpoint-deletion races during experiment synchronization. After an interrupted Ray run, rerun `python3 src/flat/cases/ray/train.py` with the same configuration to restore its existing experiment.
