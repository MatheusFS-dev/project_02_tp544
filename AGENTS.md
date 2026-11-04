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
- Unless explicitly requested otherwise, install with `uv sync` without flags, activate with `source .venv/bin/activate`, and execute with `python3` (including `python3 -m pytest`). Do not use `uv run` or require additional uv arguments.
- Default to physical GPU 0. Set `CUDA_DEVICE_ORDER`, `CUDA_VISIBLE_DEVICES` and `TF_FORCE_GPU_ALLOW_GROWTH` through `os.environ` before framework imports. CPU execution requires an explicit request or configuration.
- Keep all user documentation except the root `README.md` under `docs/`. Keep commands for every supported runner and validation case in the root README. Agent entry points (`AGENTS.md`, `CLAUDE.md`) and reusable `.agents/context/` material retain their required locations.

## Runner configuration and data

- Each module always loads its complete TOML from `src/configs/` directly. Do not add command-line config arguments. Keep all shipped configs on `cuda:0`.
- TOML `data` paths are relative to the TOML file. Runners load the received NPZ arrays and must never generate data or substitute fake input when a file is missing.
- Only the standalone `data/fake_generator.py` creates example data, when explicitly executed. Tests may use it to create temporary fixtures.
