> Current full-training configuration: all four TOMLs use up to 50 epochs, patience 8, 100 search candidates and runs/treinar_full. RUN.md is the root execution guide. Entry points mirror console output into runs/treinar_full/logs. Raw and processed datasets are tracked by explicit user request. Earlier short-run budgets below describe historical validation.

# Current family-expert implementation

Refreshed 2026-11-09 from executable sources. Root `PROBLEM_ARCHITECTURE.md` is the architecture reference. Root `README.md` owns execution commands. Existing runner TOMLs remain authoritative for current paths and budgets.

`core.Architecture(schema=2)` selects the shared trunk, twelve family logits, substrate logits and twelve small parameter heads. `families.py` owns active fields and scales. Seven padded coordinates use native HFSS radii, lengths and widths, not legacy outer/inner diameters. Training routes regression with the true family. Prediction selects the argmax family's expert and reports inactive fields as null. AutoKeras uses equivalent heads and exports equivalent PyTorch weights. Family metrics distinguish oracle routing from correctly routed regression.

`family_data.py` validates all received spectra and groups repeated physical parameterizations before stratification. `prepare_families` uses split-local minimax flat-target labeling with family-stratified geometry partitions (70/15/15). It must not be confused with historical minimax flat-target request preparation. Geometry-held-out and catalogue-shared request evaluations answer different questions. Preserve the chosen objective in preparation metadata.

Version-one model loading remains supported. Changed datasets require fresh run directories. Package defaults to physical GPU 0 and preserves explicit CUDA_VISIBLE_DEVICES. RTX 4070 is physical GPU 1 on this machine. Checkpoint, optimizer and RNG recovery remain shared by expert training and the runners.

All 2,000 originals are preserved under `data/raw/treinar`. There are 1,926 unique designs and 74 repetitions with identical spectra. All supplied spectra describe air. Exact-catalogue physical verification remains separate from regression accuracy. Unseen predictions require simulation.

The older snapshot below is retained for provenance and does not describe the new expert schema.

# Historical implementation snapshot (2026-11-06)

Generated source-derived context, refreshed 2026-11-06. Canonical sources take precedence. HEAD: `e50d270415be53dd55d1b880cde2913956fcaf6b`.

## Runtime and entry points

Python >=3.12,<3.13, hatchling src layout. Dependencies pinned in pyproject.toml and uv.lock. Setup: `uv sync`, then `source .venv/bin/activate`. Use only project .venv.

Run `python3 src/inverse_design/baseline.py`, `python3 src/inverse_design/optuna_search.py`, `python3 src/inverse_design/autokeras_search.py`, or `python3 src/inverse_design/ray_search.py`. Each main loads its complete matching src/configs/<runner>.toml through training.load_config. No config CLI arguments. Data paths resolve relative to TOML, output relative to working directory. All shipped configs use cuda:0, 50 epochs, 100 candidates, seed 42 and output runs. Baseline ignores candidates. Package __init__.py sets physical GPU 0 and deterministic CUDA environment before framework imports. CPU requires explicit configuration.

## Data and model

core.dataset validates received NPZ keys x (N,3), geometry (N,), substrate (N,), coordinates (N,2), train/validation/test indices. Labels are integer geometry 0 disk, 1 square, 2 circular ring, 3 square ring, substrate 0 air, 1 SiO₂. Splits must be nonempty, disjoint and cover all rows. No fixed sample count. Missing data fails, without generation. data/fake_generator.py alone explicitly creates example data. CSV examples require conversion and supervised-label decisions.

core.normalize validates 450 <= A < B <= 1600 and 0 <= X <= 1, then normalizes wavelength columns by (value-450)/1150. Coordinates represent outer/320 and inner/outer in [0,1]. Solids require zero inner ratio. core.decode constrains dimensions to 0–320 nm and forces solids' inner dimension to zero.

core.Architecture defaults to three residual blocks, width 256, SiLU, no dropout. Model uses shared projection/trunk, geometry logits (4), substrate logits (2), and two hard-sigmoid coordinates. training.loss sums two cross-entropies and Huber loss equally. AdamW, early stopping on validation loss, and independent retention of lowest validation-loss weights. Metrics include class and joint accuracy and decoded dimension MAE. Search candidates do not evaluate test data, winner exports do.

## Search and persistence

optuna_search.run uses persistent SQLite seeded TPE, sequential trials, and sample_architecture journals each draw for interruption replay. ray_search.run uses seeded random search, one concurrent trial, ASHA grace min(10,epochs), reduction factor 3. Ray candidate restores registered checkpoint over local state. Both search depth 1–6, widths 64/128/256/512, activations relu/silu/gelu, dropout 0/.1/.2/.3, residual trunks.

autokeras_search.run uses Keras torch backend. autokeras_adapter builds genuine AutoModel with dense/residual trunks and fixed heads. RecoverableTuner controls explicit batches, optimizer, variables, RNG and early stopping. Version checks pin AutoKeras 3.0.0, Keras 3.11.3 and KerasTuner 1.4.7. Adapter bypasses preprocessing and final full-data refit, converts Keras weights to PyTorch, and exports best.keras too.

storage.py provides atomic/fsync writes, exclusive kernel locks, checksummed serialization, manifest compatibility and two valid epoch generations with corrupted-newest fallback. training.prepare fingerprints config, architecture and data arrays and saves data.npz. Changed data/config requires a new output root. training.train restores optimizer, random state, history and patience. best.ckpt is inference state, epoch checkpoints are recovery state. search.export_winner writes all winner artifacts before complete.json. Completed searches reuse the saved result.

Public APIs in __init__.py: Architecture, Model, Config, normalize, decode, train, load_model, predict. predict accepts physical rows and returns class names/probabilities and dimensions.

## Verification and limits

Canonical commands: README.md. `pytest -q` and `python3 -c "import compileall; compileall.compile_dir('src', quiet=1); compileall.compile_dir('tests', quiet=1)"`. pytest config only sets tests directory. No separate lint/type-check configuration in pyproject.toml. Tests cover domain/model, configuration and received-data validation, CPU recovery, Optuna draw replay, winner completion ordering, AutoKeras export/recovery, and Ray checkpoint restoration/interruption.

No tests or training were executed during ingestion. docs/verification.md reports historical 2026-11-04 results of 25 passing tests and one-epoch GPU runner checks. Those are recorded claims, not newly reproduced results. Full search budgets and physical absorption accuracy remain unverified. Existing reference context covers proposal conflicts and original geometries. Do not equate synthetic learning with HFSS validation.

## Snapshot hashes

- `pyproject.toml` SHA-256 `da076585b65f1ebcbf24efe8640aed004af27e833c53a2a3016b1b80156e194a`
- `uv.lock` SHA-256 `4b6f5d4d99fe2dc57598ed26c8f07243c92191bf1b54a38e24e92fbe138cbd30`
- `src/inverse_design/__init__.py` SHA-256 `8c6c5ab0da0f4f4b47722d8ed73c7ed0d363c324267946fd25370c4c4e49e676`
- `src/inverse_design/autokeras_adapter.py` SHA-256 `2c5e9128d4330dca1077ceaef265fdb3fa37a38361a1c989f907019097dfb6bc`
- `src/inverse_design/autokeras_search.py` SHA-256 `136b41b03d2cf7f75ef7b81247e6a2e8cff6b52548acd7d9ce795ca4b29d6d49`
- `src/inverse_design/baseline.py` SHA-256 `1bf6bbb3e473bb7caf2542a58a2ef03346479a7f3e8a47ff74421c4a517f359d`
- `src/inverse_design/core.py` SHA-256 `76c094ba0a49c33ac0f7bbf9be939e3c57cb11d911b301662053307b228317ce`
- `src/inverse_design/optuna_search.py` SHA-256 `732d949a784437e4f9912b87a9d5bd326c64c044a796a37ebe3cd525fd4a6070`
- `src/inverse_design/ray_search.py` SHA-256 `4afc5c763eadd78dcfdfc13333d5c49974b7b274999aaef2c5ef4c8c0ee79ea4`
- `src/inverse_design/search.py` SHA-256 `7a2f021353aa1a282c121efdc1f5cb2d7ffb9f82dac5924d0432c4cd131729cf`
- `src/inverse_design/storage.py` SHA-256 `87d0ba91e143e089d9937bc8f0a1e67db70e41f590f044fe5e755e3278f33470`
- `src/inverse_design/training.py` SHA-256 `f70d6ddadc8d801213095a7fffb3af9422f8051473d8cf171a31b00e78025eb2`
- `src/configs/autokeras.toml` SHA-256 `0edad8739c302fb9a017aff7e7a6da169a9e8297e7eb6a1bb64b5ba2060e51e2`
- `src/configs/baseline.toml` SHA-256 `0edad8739c302fb9a017aff7e7a6da169a9e8297e7eb6a1bb64b5ba2060e51e2`
- `src/configs/optuna.toml` SHA-256 `0edad8739c302fb9a017aff7e7a6da169a9e8297e7eb6a1bb64b5ba2060e51e2`
- `src/configs/ray.toml` SHA-256 `0edad8739c302fb9a017aff7e7a6da169a9e8297e7eb6a1bb64b5ba2060e51e2`

Current full-family preprocessing: preserve the minimax constant-absorption objective, split unique geometries by family before label construction, and select labels only within each partition. Seed 42 yields 1,348/289/289 designs and 5,392/1,156/1,156 requests. Audit source-family and winning-label coverage separately. Defaults use data/processed/treinar_families_v2/dataset.npz and runs/treinar_families_v2.
