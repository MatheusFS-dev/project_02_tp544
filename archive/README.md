# Archived inverse-design workflow

`inverse_design/` preserves the retired inverse-label scripts, configs, processed data, training/search runs, selected results, validation, tests, documentation and earlier agent context. Its README.md, RUN.md, AGENTS.md, pyproject.toml and uv.lock are historical snapshots and do not describe the active environment.

No archived Python package is installed by root `uv sync`, and archived tests are excluded from root `pytest`. The shared received raw dataset has one canonical location, `src/air_only/data/raw/`, with an archive-only reference symlink. Original source paths in historical manifests and logs are intentionally preserved.

Active commands and documentation are linked from the root README.md.
