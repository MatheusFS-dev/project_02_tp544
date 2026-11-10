# Project Instructions

Global task gates and reusable skills are installed at user scope. Codex and Antigravity read this file directly. Claude reads it through `CLAUDE.md`.

- Treat repository files and executable checks as the source of truth when prose context is stale.
- Inspect existing build, test, lint, and type-check configuration before inventing commands.
- Keep changes scoped to the requested behavior and preserve established architecture and naming.
- Do not modify installed skills unless the user explicitly requests a skill change.
- Do not commit datasets, model weights, credentials, environment files, generated logs, or large artifacts unless explicitly requested.

## Flat absorption workflow

- `src/flat/` is the spectrum-surrogate plus constrained minimax geometry workflow. It remains separate from inverse family-label training.
- Every runner loads its own complete `src/configs/flat_<case>.toml` for case runners, or the matching prepare/smoke TOML. Default GPU is physical 0, logical `cuda:0`. This PC's RTX 4070 smoke test explicitly selects physical GPU 1 through `CUDA_VISIBLE_DEVICES=1` before imports.
- Prepare all 2,000 received spectra, group duplicate geometries, preserve all source IDs and retain family-stratified 1,348/289/289 unique-design splits. Do not create inverse winner labels for forward training.
- Surrogate output is full-grid T/R/A, softmax-normalized per wavelength. Training/search validation measures spectrum fit. Geometry optimization ranks worst in-band absolute absorption-target error first, then wavelength-weighted mean error. Include interpolated band endpoints.
- Fit geometry bounds and choose optimization starts from training geometries only. Preserve inactive masks, local trust bounds and positive ring holes. Export predicted spectra and explicitly distinguish them from actual HFSS results.
- The four independent cases live under `src/flat/cases/{baseline,optuna,autokeras,ray}/`, each with `train.py` and `optimize.py`. Each publishes only its own final model at `runs/flat/<case>/final/best.ckpt`, with case-local logs and designs. No cross-case model selection or method prompt is allowed. Shared numerical/library code is permitted. All four preserve resumable epoch/optimizer/RNG state. Changing dataset/config requires a new run root. The selected search model is evaluated on test spectra only after validation-based selection.
- `python3 src/flat/smoke.py` runs short real-data GPU checks and removes temporary checkpoints/logs. Its report lives under `src/validation/flat/smoke/`. Commands and settings are documented in `RUN.md`; architecture-only documentation is `docs/flat_architecture.md`.

Add only durable repository-specific information below, such as non-obvious architecture constraints, canonical commands, protected paths, and required validation.

## Python environment and execution

- Keep `pyproject.toml` and `uv.lock` in the repository. Plain `uv sync` must install all dependencies needed by the documented runners and tests.
- Use only the project `.venv`. Do not create nested or per-runner environments.
- Unless explicitly requested otherwise, install with `uv sync` without flags, activate with `source .venv/bin/activate`, and execute with `python3` (including `pytest`). Do not use `uv run` or require additional uv arguments.
- Default to physical GPU 0. Set `CUDA_DEVICE_ORDER`, `CUDA_VISIBLE_DEVICES` and `TF_FORCE_GPU_ALLOW_GROWTH` through `os.environ` before framework imports. CPU execution requires an explicit request or configuration.
- Keep all user documentation except the root `README.md` and user-requested `PROBLEM_ARCHITECTURE.md` and `RUN.md` under `docs/`. Keep commands for every supported runner and validation case in the root README. Agent entry points (`AGENTS.md`, `CLAUDE.md`) and reusable `.agents/context/` material retain their required locations.

## Runner configuration and data

- Each module always loads its complete TOML from `src/configs/` directly. Do not add command-line config arguments. Keep all shipped configs on `cuda:0`.
- TOML `data` paths are relative to the TOML file. Runners load the received NPZ arrays and must never generate data or substitute fake input when a file is missing.
- Only the standalone `data/fake_generator.py` creates example data, when explicitly executed. Tests may use it to create temporary fixtures.


## Full-family expert architecture

- `PROBLEM_ARCHITECTURE.md` is the user-requested root architecture reference.
- `families.py` defines F01–F12, seven native HFSS parameters, normalization scales and active masks. Circular parameters are radii, unlike legacy outer/inner diameters.
- Architecture schema 2 uses a shared trunk, 12-class family head, substrate head and twelve small parameter heads. Route regression using true families during training and predicted families at inference. Inactive dimensions must not contribute to loss or be reported as applicable.
- Preserve schema-1 checkpoint loading. Use fresh output roots for changed data/architecture. Never overwrite prior run manifests to force a resume.
- All 2,000 received spectra remain in `data/raw/treinar/`. Group identical geometries before any geometry-held-out split. Keep all requests from a geometry in the same partition and preserve duplicate source-ID provenance.
- Distinguish measured band-mean inversion from minimax flat-target request labeling. Never change the absorption objective silently or claim flat absorption from band means.
- Physical GPU 1 on this machine is the RTX 4070. Set `CUDA_VISIBLE_DEVICES=1` through `os.environ` before imports to select it. Keep TOML logical devices on `cuda:0`.
- Verify expert routing/masking and Keras-to-PyTorch expert export with `pytest -q tests/test_families.py`, followed by the complete suite.

Current full-family preprocessing: preserve the minimax constant-absorption objective, split unique geometries by family before label construction, and select labels only within each partition. Seed 42 yields 1,348/289/289 designs and 5,392/1,156/1,156 requests. Audit source-family and winning-label coverage separately. Defaults use data/processed/treinar_families_v2/dataset.npz and runs/treinar_families_v2.

Full-training entry points mirror stdout/stderr into append-only logs through run_logging.logged_runner. Preserve terminal stage/epoch messages and batch ETA/throughput. Current configs use 50 maximum epochs, patience 8, 100 search candidates and runs/treinar_full. Raw and processed datasets are explicitly authorized for Git tracking. Runtime logs/checkpoints remain excluded. RUN.md owns the full-training command summary.

Baseline post-training validation uses `python3 src/validation/baseline/baseline_results.py`, then `python3 src/validation/baseline/hfss_cases.py`. Keep the original AEDT projects untouched. Five cases are selected deterministically from test requests for predicted-family diversity without correctness filtering. Reuse received geometry/material/boundary/sweep functions without executing their batch driver. Physical claims require actual exported solver spectra, not classification metrics or nearest catalogue matches. Validation scripts, logs, artifacts and reports must be grouped by training case under `src/validation/<case>/`, for example `src/validation/baseline/`. This user-requested location overrides the general documentation directory rule for validation reports.

Canonical trained baseline artifacts live in `results/baseline/`. The old run and log paths are compatibility symlinks. Preserve them and the original manifest/config fingerprints for compatible resume. Baseline validation loads `results/baseline/` directly.

Optuna validation lives entirely under `src/validation/optuna/`. `optuna_results.py` reads the selected trial identity from `results/optuna/complete.json`, loads `winner/best.ckpt`, verifies equality with that trial checkpoint, and uses the search-root retained dataset. Plot history comes from the selected trial, not winner summary metrics. Never choose a trial by test performance.

Ray validation lives entirely under `src/validation/ray/`. `ray_results.py` resolves the selected trial using the basename of the original identity under `results/ray/experiment/`, because results may come from another PC. Training history and checkpoint verification use that candidate’s `training/` directory. Inference uses `results/ray/winner/` and the retained search-root dataset.

Bandwidth analyses stay within each validation case. Separate family-label accuracy from absorption feasibility. Controlled bandwidth comparisons must keep the target and wavelength center fixed, use nested wavelength intervals with interpolated endpoints, and verify monotonic worst error. Catalogue results describe received spectra, never the unsimulated predicted geometry.

The trained flat baseline is canonical at `results/flat/baseline/`, including its retained dataset snapshot. Preserve the `runs/flat/baseline` compatibility symlink and unchanged configuration fingerprints. Full-spectrum test evaluation, fixed five-request optimization and actual HFSS validation scripts/artifacts/reports live entirely under `src/validation/flat/baseline/`. Match the earlier inverse baseline target bands/levels for paired physical comparison, but never describe forward fidelity as flat-target success.

Ray flat-spectrum mutable epoch state belongs under `runs/flat/ray/training/<trial-id>/`, outside the experiment artifact tree. Ray asynchronously copies driver artifacts while the trainer prunes old epoch generations, so placing mutable `training/` files under `get_trial_dir()` causes synchronization FileNotFoundError. Publish checkpoints through `tune.report`, and export the winner from its committed Ray checkpoint. Preserve existing experiments and manifests when resuming.

Flat Optuna validation uses the validation-selected trial copied to `results/flat/optuna/`, including the retained dataset and matching trial checkpoint. Preserve the original run. Its scripts, reports, plots and actual HFSS projects live under `src/validation/flat/optuna/`. Use the same five fixed target requests as the flat baseline and verify exported winner equality with the selected trial before validation.

Flat Ray validation reads `results/flat/ray/`, copied from the received completed run. Verify the final model against the selected candidate’s committed checkpoint using `artifact_inventory.json`, and verify the retained dataset hash. Keep case scripts, reports, plots and actual HFSS projects under `src/validation/flat/ray/`. Use the same five fixed target requests as flat baseline and Optuna. Preserve downloaded source artifacts.

Flat AutoKeras validation reads `results/flat/autokeras/`, preserving the downloaded source. Verify the exported checkpoint against the validation-selected trial and retained dataset, and native Keras/exported spectrum parity. All case scripts, reports, plots and HFSS projects live under `src/validation/flat/autokeras/`. Preserve the same five fixed target requests as the other flat cases.
