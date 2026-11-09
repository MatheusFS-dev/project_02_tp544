# Project Instructions

Global task gates and reusable skills are installed at user scope. Codex and Antigravity read this file directly. Claude reads it through `CLAUDE.md`.

- Treat repository files and executable checks as the source of truth when prose context is stale.
- Inspect existing build, test, lint, and type-check configuration before inventing commands.
- Keep changes scoped to the requested behavior and preserve established architecture and naming.
- Do not modify installed skills unless the user explicitly requests a skill change.
- Do not commit datasets, model weights, credentials, environment files, generated logs, or large artifacts unless explicitly requested.

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
