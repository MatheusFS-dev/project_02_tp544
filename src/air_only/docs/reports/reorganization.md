# Air-only repository reorganization

Date: 2026-11-10T10:45:31-03:00

All active flat/final scripts, configs, shared numerical helpers, raw/processed data, trained results, runs, validation, tests and documentation now live under `src/air_only/`. The retired inverse workflow and its artifacts are preserved under `archive/inverse_design/`. Historical agent context is archived as well. Root README.md and AGENTS.md point only to the active workflow.

Weights, raw HFSS sources, prepared dataset hashes and baseline/Optuna recovery fingerprints were preserved. The earlier comparison datasets retain their 70/15/15 split; the final dataset retains its 80/20 split. No data were regenerated and no full training or physical simulation was repeated. Historical absolute paths inside immutable manifests/logs remain provenance. The archive refers to the one canonical received raw dataset through a symlink.

Checks passed: 20 active tests, four-framework GPU smoke, four-final-model GPU smoke, preserved native AutoKeras/export parity, all four retained-model test metrics, all 20 existing HFSS case reports and local report links. The old top-level flat/inverse packages are no longer installed. Temporary verification artifacts were removed. No Git staging, commit or push was performed.

Commands: [RUN.md](../RUN.md). Archive overview: [archive/README.md](../../../../archive/README.md).
