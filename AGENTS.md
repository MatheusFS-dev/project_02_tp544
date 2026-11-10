# Project instructions

- Treat executable code and checks as authoritative. Keep changes scoped and preserve conventions. Never modify installed skills or stage, commit or push without explicit authorization.
- Only the air-only flat workflow is active. All project code, configs, data, results, runs, validation, docs and tests belong under `src/air_only/`. Import `air_only.*`, never archive code. `archive/inverse_design/` is historical. Do not recreate the old layout.
- Commands: `src/air_only/docs/RUN.md`. Reports: `src/air_only/docs/reports/`. Case validation scripts and artifacts: `src/air_only/validation/flat/<case>/`. Historical comparison fixtures remain in `validation/reference/`. Paths below are relative to `src/air_only/` unless stated otherwise.

## Execution

- Keep root `pyproject.toml`, `uv.lock` and one `.venv`. Install only with plain `uv sync`, activate the environment, then use `python3 path.py`. No `uv run`, nested environments or CLI config arguments.
- Runners load complete TOMLs from `configs/`. Data/raw paths are TOML-relative. Flat output paths are air_only-root-relative; all `final.toml` paths are TOML-relative.
- Set `CUDA_DEVICE_ORDER`, `CUDA_VISIBLE_DEVICES` and `TF_FORCE_GPU_ALLOW_GROWTH` before framework imports. Default: physical GPU 0, logical `cuda:0`. This PC's RTX 4070 is physical GPU 1; select it explicitly for smoke checks. No implicit CPU fallback.
- Missing real inputs must fail. Only explicit preparation runners create processed data. No fake spectra or substituted inputs.

## Data and models

- Preserve all 2,000 received spectra, original HFSS files and hashes in `data/raw/treinar/`. Group duplicate geometries before splitting; preserve source IDs. `shared/families.py` defines F01–F12, native parameters, scales and masks. Circular sizes are radii; square sizes are side lengths.
- Comparison cases: `flat/cases/{baseline,optuna,ray,autokeras}/`, each independent with `train.py` and `optimize.py`. Preserve the 1,348/289/289 train/validation/test split. Select winners by validation only. Retained models: `results/flat/<case>/final/`; preserve the `runs/flat/baseline` compatibility symlink.
- Final workflow: `final/prepare.py` creates the 1,541/385 train/validation split across 1,926 unique geometries, with an empty test array. `final/train_all.py` retrains the four selected topologies from scratch, without searches, into `runs/final/<case>/final/`. AutoKeras's selected topology uses PyTorch. Optuna and Ray selected identical topologies.
- Output is per-wavelength softmax T/R/A. Optimize worst in-band absorption-target error, then wavelength-weighted mean error, including interpolated endpoints. Use training-only bounds/starts; preserve masks and positive ring holes. Predictions require actual HFSS verification.
- Preserve atomic epoch/optimizer/RNG recovery, fingerprints, batch progress, epoch metrics and case-local logs. Changed data/settings require a new run directory. Keep Ray rotating checkpoints under `runs/flat/ray/training/<trial-id>/`, outside asynchronous experiment artifacts; publish through `tune.report` and export committed checkpoints.
- `final/infer_<case>.py` prints native nm dimensions and saves `geometry.json`. `final/hfss.py` accepts that file or manual geometry, copies the received template and preserves original materials, boundaries, Floquet ports and 401-point sweep. Reject non-air substrates; interpolate target endpoints. Never edit received projects.
- Datasets are authorized for tracking. Weights, runtime logs and large solver artifacts remain ignored.

## Verification

- `pytest -q` runs active tests only.
- `python3 src/air_only/final/smoke.py` checks GPU training, recovery and inference; `python3 src/air_only/flat/smoke.py` also checks the four search frameworks. Remove temporary verification artifacts.
