# Running the air-only flat workflows

Run commands from the repository root. The one project environment is `.venv`.

```bash
uv sync
source .venv/bin/activate
```

All active scripts, data, results, validation and documentation live under `src/air_only/`. The inverse-design workflow is archived under `archive/inverse_design/` and is not installed or tested by the active environment. All received spectra use air.

## Flat absorption matching: four independent cases

The `src/air_only/flat/` workflow predicts complete spectra from geometry, then minimizes
worst absorption-target error throughout your requested wavelength band.
Baseline, Optuna, AutoKeras and Ray are independent cases. Each trains and exports
one final model. No case selects, trains or loads another case's model.

Prepare the shared received data once:

```bash
python3 src/air_only/flat/prepare.py
```

Then run whichever cases you want, sequentially to avoid competing for GPU memory:

| Case | Train its final model | Design using only that final model |
| --- | --- | --- |
| Baseline | `python3 src/air_only/flat/cases/baseline/train.py` | `python3 src/air_only/flat/cases/baseline/optimize.py` |
| Optuna | `python3 src/air_only/flat/cases/optuna/train.py` | `python3 src/air_only/flat/cases/optuna/optimize.py` |
| AutoKeras | `python3 src/air_only/flat/cases/autokeras/train.py` | `python3 src/air_only/flat/cases/autokeras/optimize.py` |
| Ray | `python3 src/air_only/flat/cases/ray/train.py` | `python3 src/air_only/flat/cases/ray/optimize.py` |

Each case reads its own complete `src/air_only/configs/flat_<case>.toml`. The fixed
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

- Final model: `src/air_only/runs/flat/<case>/final/best.ckpt`.
- Final metrics and configuration: `src/air_only/runs/flat/<case>/final/metrics.json` and `config.json`.
- Resumable training/trial state: `src/air_only/runs/flat/<case>/`.
- Append-only progress logs: `src/air_only/runs/flat/<case>/logs/train.log` and `optimize.log`.
- Geometry designs and predicted spectra: `src/air_only/runs/flat/<case>/designs/<request-id>/`.

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
python3 src/air_only/flat/prepare.py
python3 src/air_only/flat/cases/baseline/train.py
python3 src/air_only/flat/cases/baseline/optimize.py
```

GPU 0 is the default. On this PC, select the RTX 4070 before running commands
with `export CUDA_VISIBLE_DEVICES=1`. TOMLs stay on logical `cuda:0`. No runner
silently substitutes CPU execution.

Short verification of all four cases:

```bash
python3 src/air_only/flat/smoke.py
```

This validates all real source data, trains 120 geometries for two epochs, and
evaluates 36 validation/test geometries covering all families. It checks baseline
resume, two actual trials for each search, four independent final models,
AutoKeras export parity, and twelve-family design for each case. Temporary smoke
checkpoints and logs are removed. Report: `src/air_only/validation/flat/smoke/smoke.md`.
Smoke metrics are not full-training or physical HFSS results.

Architecture reference: [flat_architecture.md](flat_architecture.md).


## Trained flat baseline validation

The completed flat baseline is retained in `src/air_only/results/flat/baseline/`, including
`final/best.ckpt`, metrics, training state/logs and a checksummed dataset snapshot.
`src/air_only/runs/flat/baseline` is a compatibility symlink, so its independent training and
design commands keep working without changing configuration fingerprints.

```bash
python3 src/air_only/validation/flat/baseline/baseline_results.py
python3 src/air_only/validation/flat/baseline/hfss_cases.py
python3 src/air_only/validation/flat/baseline/hfss_report.py
```

All scripts, logs, plots, reports, optimized candidates and five AEDT projects
are under `src/air_only/validation/flat/baseline/`. The first command verifies all 289
held-out spectra and optimizes the same five targets used by the earlier inverse
baseline. The second performs actual GUI HFSS simulations. The third refreshes
the physical comparison report without rerunning the solver. Existing optimized
cases and completed simulations are reused after their provenance is checked.

Ray recovery note: mutable training checkpoints are kept outside the asynchronous experiment artifact tree under `src/air_only/runs/flat/ray/training/<trial-id>/`. This avoids checkpoint-deletion races during experiment synchronization. After an interrupted Ray run, rerun `python3 src/air_only/flat/cases/ray/train.py` with the same configuration to restore its existing experiment.

### Flat Optuna validation

The validation-selected trial and retained dataset are copied to `src/air_only/results/flat/optuna/`. The original run remains in `src/air_only/runs/flat/optuna/`. All case scripts, reports, figures and HFSS projects are under `src/air_only/validation/flat/optuna/`. The five target requests match the flat baseline for paired comparison.

```bash
python3 src/air_only/validation/flat/optuna/optuna_results.py
python3 src/air_only/validation/flat/optuna/hfss_cases.py
python3 src/air_only/validation/flat/optuna/hfss_report.py
```

### Flat Ray validation

The validation-selected candidate from `Downloads/ray` is copied to `src/air_only/results/flat/ray/`, with its committed checkpoint, training state, search summary, logs and verified dataset snapshot. The downloaded run is preserved. All validation scripts, reports, figures and HFSS projects are under `src/air_only/validation/flat/ray/`. The five target requests match the flat baseline and Optuna for paired comparison.

```bash
python3 src/air_only/validation/flat/ray/ray_results.py
python3 src/air_only/validation/flat/ray/hfss_cases.py
python3 src/air_only/validation/flat/ray/hfss_report.py
```

### Flat AutoKeras validation

The validation-selected trial from `Downloads/autokeras` is copied to `src/air_only/results/flat/autokeras/`, including its native Keras model, exported checkpoint, training state, tuner metadata, logs and verified dataset snapshot. The downloaded run is preserved. All validation scripts, reports, figures and HFSS projects are under `src/air_only/validation/flat/autokeras/`. The five target requests match the other flat cases for paired comparison.

```bash
python3 src/air_only/validation/flat/autokeras/autokeras_results.py
python3 src/air_only/validation/flat/autokeras/hfss_cases.py
python3 src/air_only/validation/flat/autokeras/hfss_report.py
```
# Final models: all received data, 80% training / 20% validation

The final workflow is `src/air_only/final/`. It uses all 2,000 received spectra, grouped into 1,926 distinct geometries before the split: 1,541 training and 385 validation. There is no test partition. This user-approved version uses air, matching the received data.

The four topologies are taken from `src/air_only/results/flat/{baseline,optuna,ray,autokeras}/final/`, which must remain available. They are trained from scratch using the same forward-spectrum objective, without repeating searches. The AutoKeras-selected exported topology uses the shared PyTorch trainer here. Each final model is independently selected by its own validation loss.

The selected Optuna and Ray topologies are identical. With the same final training settings and seed, their new models may therefore be equivalent. They retain separate training state and output directories.

```bash
source .venv/bin/activate
python3 src/air_only/final/prepare.py
python3 src/air_only/final/train_all.py
```

Settings are in `src/air_only/configs/final.toml`: GPU `cuda:0`, maximum 300 epochs, patience 30, batch size 64. Training prints per-batch progress and epoch metrics, saves atomic resumable checkpoints and mirrors output to `src/air_only/runs/final/<case>/logs/train.log`. Run `train_all.py` again after an interruption to resume. Do not change the split or settings in an existing run directory.

After training, choose the model whose geometry you want:

```bash
python3 src/air_only/final/infer_baseline.py
python3 src/air_only/final/infer_optuna.py
python3 src/air_only/final/infer_ray.py
python3 src/air_only/final/infer_autokeras.py
```

Each inference script asks for band start/end in nm and desired constant absorption in percent, for example 600, 700 and 30. It prints family, applicable dimensions in nm, tracks and air substrate as ordinary text. Circular sizes are radii. It saves `geometry.txt`, `geometry.json`, all 12 family candidates and predicted spectra under `src/air_only/runs/final/<case>/designs/`. The printed values describe the optimized geometry, not a guarantee that HFSS will match the target.

Generate or simulate the geometry:

```bash
python3 src/air_only/final/hfss.py
```

Paste the printed `geometry.json` path, or leave it blank to enter a family and its dimensions manually. Choose `simulate` for the original 401-point HFSS solve, or `generate` to create the visible project only. The received gold dispersion, 320 nm cell, 30 nm thickness, periodic boundaries, normal incidence and Floquet/sweep settings are reused. Results are saved under `src/air_only/runs/final/hfss/`. AEDT remains open. `src/air_only/runs/final/logs/hfss.log` records progress. Solving requires the configured AEDT installation and a license. Air is the only supported substrate in this version.

Optional two-epoch training/inference smoke check:

```bash
python3 src/air_only/final/smoke.py
```

This checks every final topology with short real-data GPU training and removes its temporary models. It does not replace `train_all.py`. Default GPU is physical 0. On this PC, the RTX 4070 is physical 1 and can be selected before Python starts with `export CUDA_VISIBLE_DEVICES=1`.

## Final models: five fixed narrow-band HFSS examples

After all four final models are trained:

```bash
python3 src/air_only/validation/final/run_validation.py
```

This resumes the same five dataset-supported requests for all four models. It preserves the original HFSS setup, opens graphical AEDT, and saves designs, solver projects, actual spectra, T/R/A and band-detail plots under `src/air_only/validation/final/`. Read `SUMMARY.md` there for the comparison. Identical physical proposals share an explicitly linked real simulation. Rerun the command after an interruption to reuse completed inferences and solves. Dataset, model and configuration fingerprints must remain unchanged.
