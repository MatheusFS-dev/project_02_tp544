# Inverse design

See [RUN.md](RUN.md) for full-training commands, GPU selection, progress logs and recovery.

For flat absorption matching, use the four independent cases in `src/flat/cases/`:
baseline, Optuna, AutoKeras and Ray. Each exports its own final model under
`runs/flat/<case>/final/` and has its own design command. See
[RUN.md](RUN.md#flat-absorption-matching-four-independent-cases) and
[the architecture](docs/flat_architecture.md).

```bash
python3 src/flat/prepare.py
python3 src/flat/cases/baseline/train.py
python3 src/flat/cases/optuna/train.py
python3 src/flat/cases/autokeras/train.py
python3 src/flat/cases/ray/train.py
```

Use only the matching design command after training:

```bash
python3 src/flat/cases/baseline/optimize.py
python3 src/flat/cases/optuna/optimize.py
python3 src/flat/cases/autokeras/optimize.py
python3 src/flat/cases/ray/optimize.py
```

Short GPU pipeline verification: `python3 src/flat/smoke.py`. Design commands ask
only for band start, band end and target absorption. Predicted spectra require
HFSS verification. No method is automatically selected across cases.

Three-head inverse model predicting geometry, substrate, and outer/inner size
in nanometers. Includes a residual PyTorch baseline and independent Optuna,
AutoKeras, and Ray Tune searches. The runners receive data from an NPZ file
specified in their TOML configuration.
Received Treinar CSVs can be converted to the documented array schema.
Synthetic example results do not establish
physical feasibility or absorption accuracy. Received HFSS spectra can be
converted into flat-target training labels using the explicit tools below.

## Setup

Requires Python 3.12 and uv. From the project root:

```bash
uv sync
source .venv/bin/activate
```

`pyproject.toml` and `uv.lock` define one shared `.venv`, including all runners
and pytest. Activate it again in each new shell, then use `python3` normally.
No additional environment or uv flags are needed.

GPU execution defaults to physical GPU 0. The package sets
`CUDA_DEVICE_ORDER=PCI_BUS_ID`, `CUDA_VISIBLE_DEVICES=0`, and
`TF_FORCE_GPU_ALLOW_GROWTH=true`, and `CUBLAS_WORKSPACE_CONFIG=:4096:8`
through `os.environ` before importing the
frameworks. An explicitly set `CUDA_VISIBLE_DEVICES` is preserved.
No shell exports are needed. A CUDA-capable GPU is required for
default runs. There is no automatic CPU fallback. AutoKeras uses the PyTorch
Keras backend, so the TensorFlow growth setting has no effect on that backend.

## Data

Point `data` in each config to your received NPZ file. Paths are relative to
the TOML file. The [data schema](docs/implementation.md#data-and-objective)
defines the required inputs, labels, coordinates, and split indices. Runners
never generate data and fail if the configured file is missing.

For the fake example only, explicitly create the dataset once:

```bash
python3 data/fake_generator.py
```

This writes `data/example.npz`. To use it, explicitly select it in a config.
The generator is independent of training and is never called automatically.

## Full-family expert implementation

[PROBLEM_ARCHITECTURE.md](PROBLEM_ARCHITECTURE.md) describes F01–F12,
parameter units, shared features, family-specific heads and output semantics.
Architecture schema 2 supports all twelve families through the same baseline,
Optuna, AutoKeras and Ray module entry points. The NPZ `coordinates` array has
seven columns in native HFSS parameter order. The legacy two-column schema
remains supported. Point each runner TOML at a prepared schema-2 NPZ and use a
fresh output root before running it. Checkpoints identify their architecture
schema explicitly.

Run the expert regression checks after activation:

```bash
pytest -q tests/test_families.py
```

`python3 data/prepare_treinar.py` now prepares all twelve families. Enter
`data/raw/treinar` and a new output directory, such as
`data/processed/treinar_families_v2`. It groups identical designs and stratifies
unique geometries by family into 1,348/289/289 train/validation/test designs.
The 7,704 flat-target requests are labelled using only their own split's
catalogue. No geometry crosses splits. All 2,000 originals are accounted for.
The manifest reports source-family and winning-label coverage separately.

The four shipped TOMLs select this version-two NPZ and
`runs/treinar_full`, with up to 50 epochs and 100 candidates per search.
Use the RTX 4070 command below with any of the four modules. For version-two
physical evaluation, `python3 data/evaluate_flatness.py` prompts for the model,
NPZ, original Treinar directory and a fresh output JSON. Predictions without
exact received matches require simulation.

The following four-family preparation/results describe the earlier validation,
not the current default dataset. Its earlier converter remains available as
`inverse_design.treinar.convert_catalogue` for legacy use.

## RTX 4070 execution and prior validation

The package defaults to physical GPU 0. On the validated machine, physical GPU 1
is the RTX 4070 and physical GPU 0 is the RTX 3060. After environment activation,
run a current case on the RTX 4070 with:

```bash
CUDA_VISIBLE_DEVICES=1 python3 src/inverse_design/baseline.py
```

Replace `src/inverse_design/baseline.py` with `src/inverse_design/optuna_search.py`,
`src/inverse_design/autokeras_search.py` or `src/inverse_design/ray_search.py` for the other
cases. PCI bus ordering is set before framework imports. Physical GPU 1 becomes
logical `cuda:0`. Reruns resume existing checkpoints, so use a fresh output root
when changing data, splits or architecture.

All original received files remain in `data/raw/treinar/`, including the import
hash manifest. Earlier four-family data and results in `data/processed/treinar/`
and `runs/treinar_smoke/` remain historical. Their
[validation report](docs/reports/treinar_validation.md) does not establish the
performance of the full-family model. The old four-family converter remains
available through `inverse_design.treinar.convert_catalogue`.

## Prepare flat-target training labels

The goal is absorption as close as possible to a constant target X across
[A,B], allowing deviations above and below X. Keep the received geometry and
HFSS CSV columns shown in `data/examples/`.

Create a requests CSV with the columns below. This is the request format,
not simulated response data:

```csv
band_start_nm,band_end_nm,target_absorption,split
500,600,0.75,train
500,600,0.80,validation
500,600,0.85,test
```

Use your intended bands and levels. Each request must be unique, all three
splits must be nonempty, and both endpoints must appear on the received grid.
All catalogue spectra must have the same complete wavelength grid. Blank
absorption values in the HFSS template are rejected.

After setup and activation, run:

```bash
python3 data/prepare_flatness.py
```

The script prompts for geometry CSV, HFSS CSV, requests CSV and output
directory. It selects the design with the smallest maximum absolute deviation
from X across each sampled band. Ties use wavelength-averaged absolute error,
then simulation ID. It writes `dataset.npz`, `selection.json` (all scores and
selected labels) and `preparation.json` (source and output hashes). Existing
preparation artifacts are never overwritten.

Set `data` in each training TOML to the resulting NPZ, relative to that TOML,
and use a fresh run output root. The model, input scaling, bounded dimensions,
and training loss remain unchanged: two classification cross-entropies plus
coordinate Huber loss. These labels describe new requests over a known
catalogue, not an unseen-geometry evaluation.

## Evaluate flat-target predictions

After training a baseline or selecting a search winner, run:

```bash
python3 data/evaluate_flatness.py
```

The script prompts for the model directory containing `best.ckpt`, prepared
NPZ, original geometry/HFSS CSVs and a new output JSON path. It validates
preparation hashes and evaluates only NPZ test requests, with inference on
`cuda:0`. It does not change training losses or search selection.

Exact catalogue matches receive worst target error, wavelength-averaged
absolute error, ripple and excess worst error over the catalogue winner.
Other predicted dimensions are marked `requires_simulation` with null physical
scores. No nearby spectrum is substituted. Summary errors cover verified
predictions only, alongside verified/unverified counts. Sampled scores do not
guarantee performance between wavelength samples. No success tolerance is
assumed.

For the trained full-family baseline, generate held-out figures and then create
and solve five predicted designs in the AEDT GUI:

```bash
python3 src/validation/baseline/baseline_results.py
python3 src/validation/baseline/hfss_cases.py
```

This requires licensed local AEDT 2025 R2 and a graphical display. Results and
projects are saved in `src/validation/baseline/`, with summaries in
`src/validation/baseline/baseline_validation.md` and `src/validation/baseline/baseline_hfss.md`.
See [RUN.md](RUN.md) for selection and recovery details.
Use `python3 src/validation/baseline/hfss_report.py` to refresh comparisons from exported
spectra and solver profiles without starting a simulation.

## Run each case

After setup and activation, choose a command. Each loads its own complete
TOML automatically, using GPU `cuda:0`:

| Case | Configuration | Command |
| --- | --- | --- |
| Residual baseline | `src/configs/baseline.toml` | `python3 src/inverse_design/baseline.py` |
| Optuna TPE | `src/configs/optuna.toml` | `python3 src/inverse_design/optuna_search.py` |
| AutoKeras AutoModel | `src/configs/autokeras.toml` | `python3 src/inverse_design/autokeras_search.py` |
| Ray Tune with ASHA | `src/configs/ray.toml` | `python3 src/inverse_design/ray_search.py` |

Edit the matching TOML to select your data, training budget, and output root.
Each config includes every shared training field. The baseline ignores the
search-only `candidates` field.

The baseline allows at most 50 epochs. Current configs use up to 50 epochs and
100 candidates with one active trial. Outputs live in
`runs/treinar_full/baseline`, `runs/treinar_full/optuna`,
`runs/treinar_full/autokeras`, and `runs/treinar_full/ray`. Full searches can take substantial time and
storage. Rerun the same command to resume interrupted work. Completed searches
return their saved result without starting another budget. Use a new output
root when changing configuration or data.

For a short check, set `epochs = 3` and `candidates = 2` in the desired config,
keep `device = "cuda:0"`, and set a fresh `output` directory. Run the same
module command above. No separate short config is required.

Configuration is loaded directly from the matching file in `src/configs/`.
Edit that file before running the module. No configuration arguments are used.

## Python API

From an activated environment, open Python with `python3`, then:

```python
from inverse_design import Config, load_model, predict, train

result = train("runs/api", Config(data="data/example.npz", device="cuda:0"))
model = load_model("runs/api", device="cuda:0")
print(predict(model, [[600, 1000, 0.8]]))
```

The API receives a dataset path too. `predict` validates physical inputs and
returns geometry, substrate, sizes in nanometers, and class probabilities.

## Validation

After setup and activation:

```bash
pytest -q
```

Tests create temporary fake input explicitly and include CPU training and
recovery checks. They do not require a repository dataset, run full search
budgets, or establish GPU training acceptance. Shipped runner configs all
select `cuda:0`.

## Documentation

- [Implementation reference](docs/implementation.md): configuration, received
  data schema, architecture, objectives, search spaces, recovery, and exports.
- Design: [proposal](docs/design/idea.md) and
  [professor instructions](docs/design/professor_instructions.md).
- [Verification](docs/verification.md): current checks and historical results.
- Reference PDFs: [full inverse-design specification](docs/reference/Single_Model_Inverse_Design_Full_320nm.pdf)
  and [dataset and 14-day steps](docs/reference/Dataset_Geometry_and_14_Day_Steps.pdf).
- Geometry references: [Batende](docs/reference/geometries/batende.pdf),
  [Matheus](docs/reference/geometries/matheus.pdf), [Ivan](docs/reference/geometries/ivan.pdf),
  [Yaislin](docs/reference/geometries/yaislin.pdf).

Agent instruction entry points remain at the root. Reusable agent context
remains under `.agents/context/`.

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

AutoKeras best-trial validation, including bandwidth analysis:

```bash
python3 src/validation/inverse_design/autokeras/autokeras_results.py
python3 src/validation/inverse_design/autokeras/hfss_cases.py
python3 src/validation/inverse_design/autokeras/hfss_report.py
python3 src/validation/inverse_design/autokeras/bandwidth_analysis.py
```

AutoKeras validation reports, figures, scripts and logs are under `src/validation/inverse_design/autokeras/`. Selected training artifacts are under `results/autokeras/`, with original Downloads provenance recorded in the validation directory.

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
