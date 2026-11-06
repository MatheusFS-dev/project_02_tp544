# Inverse design

Three-head inverse model predicting geometry, substrate, and outer/inner size
in nanometers. Includes a residual PyTorch baseline and independent Optuna,
AutoKeras, and Ray Tune searches. The runners receive data from an NPZ file
specified in their TOML configuration.
Existing CSV examples need conversion to the documented array schema.
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
frameworks. No shell exports are needed. A CUDA-capable GPU is required for
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

This writes `data/example.npz`, the default input named in all four configs.
The generator is independent of training and is never called automatically.

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

## Run each case

After setup and activation, choose a command. Each loads its own complete
TOML automatically, using GPU `cuda:0`:

| Case | Configuration | Command |
| --- | --- | --- |
| Residual baseline | `src/configs/baseline.toml` | `python3 -m inverse_design.baseline` |
| Optuna TPE | `src/configs/optuna.toml` | `python3 -m inverse_design.optuna_search` |
| AutoKeras AutoModel | `src/configs/autokeras.toml` | `python3 -m inverse_design.autokeras_search` |
| Ray Tune with ASHA | `src/configs/ray.toml` | `python3 -m inverse_design.ray_search` |

Edit the matching TOML to select your data, training budget, and output root.
Each config includes every shared training field. The baseline ignores the
search-only `candidates` field.

The baseline allows at most 50 epochs. Each search defaults to 100 candidates
with one active trial. Outputs live in `runs/baseline`, `runs/optuna`,
`runs/autokeras`, and `runs/ray`. Full searches can take substantial time and
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
python3 -m pytest -q
python3 -m compileall -q src tests
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
