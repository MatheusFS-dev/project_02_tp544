# Synthetic inverse model

This package implements the three-head formulation in [design proposal](design/idea.md).
It predicts geometry (disk, square, circular ring, square ring), substrate
(air, SiO₂), and outer/inner size in nanometers. Synthetic examples verify
software behavior only. They establish neither absorption accuracy nor
physical feasibility. Received HFSS CSV preparation and catalogue-based physical evaluation are separate explicit tools described below.
Runners load received NPZ files. Received CSVs can be converted to the array schema below with the explicit flat-target preparation tool.

See the root [README](../README.md) for setup and all execution commands.

## Configuration

Each runner automatically loads its complete `src/configs/<runner>.toml`.
The `data` path is resolved relative to that TOML, and `output` is relative to
the working directory. Each runner always reads its matching TOML directly,
without command-line configuration arguments.
All supplied configs use `cuda:0`. Other fields and defaults are defined by
`inverse_design.training.Config`:
`seed=42`, `patience=8`, `min_delta=0.0001`, `batch_size=32`,
`learning_rate=0.001`, `weight_decay=0.0001`, `threads=1`, `output="runs"`.
`device="cuda:0"` is the default and uses physical GPU 0. The legacy `auto`
value also selects GPU 0 without a CPU fallback. Explicit `cpu` supports CPU
verification. Other GPUs are rejected. Epochs must be between 1 and 50. Keep
optimizer controls identical between runners for a fair comparison.

The output root contains separate `baseline`, `optuna`, `autokeras` and `ray`
directories. Use a new output root when changing configuration. A changed
configuration, data generator or split fingerprint rejects a resume. Do not
edit the retained manifests or checkpoints to bypass this check.

## Data and objective

Runners never generate data. They load the NPZ specified by `data` in the
TOML, validate its arrays, and retain a copy in each run's `data.npz`. A missing
file fails immediately. Dataset contents and split indices are hashed for
resume compatibility.

The received NPZ must contain:

| Array | Shape | Meaning |
| --- | --- | --- |
| `x` | `(N, 3)` | Physical A, B, X inputs before normalization |
| `geometry` | `(N,)` | Integer class indices: disk 0, square 1, circular ring 2, square ring 3 |
| `substrate` | `(N,)` | Integer class indices: air 0, SiO₂ 1 |
| `coordinates` | `(N, 2)` | Outer size / 320 and inner / outer, both in [0, 1] |
| `train` | `(N_train,)` | Integer training row indices |
| `validation` | `(N_validation,)` | Integer validation row indices |
| `test` | `(N_test,)` | Integer held-out row indices |

Splits must be nonempty, disjoint, in bounds, and cover every row exactly once.
Solids require zero inner ratio. Sample count and class balance are not fixed
by the loader.

The standalone `data/fake_generator.py` is only an example-data utility. When
explicitly executed, it writes `data/example.npz` with NumPy seed 42, 400 rows,
50 examples per geometry/substrate pair, and stratified 280/60/60 splits.
Its artificial A bands encode geometry and an X threshold encodes substrate.
It generates no spectra and is never called by the runners.

X is the desired constant absorption level, with deviations above and below X both penalized during label selection.

Inputs must satisfy `450 ≤ A < B ≤ 1600` and `0 ≤ X ≤ 1`. They normalize to
`[(A-450)/1150, (B-450)/1150, X]`. Coordinates use hard sigmoid with exact
endpoints and represent outer size / 320 and inner / outer. Decoding yields
0–320 nm, inner ≤ outer, and inner = 0 for disk and square.

The baseline projects three inputs to width 256 using SiLU and applies three
pre-normalized residual blocks. Each has LayerNorm, linear, activation,
optional dropout and linear, followed by the residual addition. Task heads
produce four geometry logits, two substrate logits and two coordinates.

Training uses AdamW and sums geometry cross-entropy, substrate cross-entropy
and Huber coordinate loss with equal weights. Early stopping monitors total
validation loss using patience 8 and minimum improvement 0.0001. The lowest
validation-loss weights are retained independently of that threshold.
Metrics report geometry, substrate and joint accuracy, plus decoded outer,
inner and combined dimensional MAE in nanometers. Decoding uses predicted
geometry for predictions and true geometry for targets, so MAE also reflects
geometry mistakes. Only the baseline and selected search winners use test data.

## Search details

Optuna uses seeded TPE. Ray uses seeded random sampling and ASHA with a
10-epoch grace period and reduction factor 3. Short runs below 10 epochs use
their epoch maximum as the grace period. Both search residual depth 1–6,
width 64/128/256/512, ReLU/SiLU/GELU and dropout 0/0.1/0.2/0.3.

AutoKeras uses a genuine `AutoModel` graph with a custom trunk block and three
fixed heads. It searches both dense and residual trunks using the same choices.
Its isolated adapter pins AutoKeras 3.0.0, Keras 3.11.3 and KerasTuner 1.4.7,
sets the PyTorch backend, and fixes compilation to the shared AdamW/loss policy.
The adapter calls the AutoModel tuner's search directly, bypassing AutoKeras's
preprocessing and automatic final refit. Explicit training batches use the
shared normalized arrays and split. No full-data final refit occurs.

## Recovery and exports

Rerun the exact command to recover from the last valid completed epoch.
Checkpoints contain model and optimizer state, completed epoch, random states,
best weights/loss, minimum-improvement monitor, early-stopping counter and
history. Files are checksummed and written with atomic replacement and fsync.
The latest two valid epoch generations and the best model are retained. A
corrupted newest generation falls back to the previous valid generation.
Checkpoints are Python serialization files intended for trusted local runs.

A kernel lock rejects simultaneous owners and is released if the process dies.
Optuna retains its SQLite study and sampler state, and resumes a running trial
with its original hyperparameters. Ray restores its experiment and resumes
unfinished or errored trials from registered epoch checkpoints. AutoKeras retains
its tuner project and restores model variables (including dropout generators),
optimizer variables, random generators and early-stopping state. CPU recovery
can be compared deterministically. Changing devices is a configuration change.

Completed search commands read `complete.json` and do not start another budget.
A search's `winner/` directory contains `best.ckpt`, `architecture.json`,
`config.json` and `metrics.json`. AutoKeras also exports `best.keras` and an
equivalent PyTorch `best.ckpt`. Baseline exports live directly under `baseline/`.
Epoch checkpoints are for recovery. `best.ckpt` is for best-validation inference.

## Python API

```python
from inverse_design import Architecture, Config, Model, load_model, predict, train

model = Model(Architecture())  # forward expects normalized inputs
result = train("runs/api", Config(device="cpu"))
model = load_model("runs/api")
predictions = predict(model, [[600, 1000, 0.8]])
print(predictions)
```

`predict` accepts physical inputs, validates and normalizes them, and returns a
list of dictionaries with `geometry`, `substrate`, `outer_nm`, `inner_nm`,
`geometry_probabilities` and `substrate_probabilities`. Probability ordering
follows the class names above. `train(..., evaluate_test=False)` is the search
candidate API and never evaluates held-out test examples. Its optional `report`
callback runs after each durable epoch checkpoint.

## Flat-target CSV preparation

`data/prepare_flatness.py` interactively receives the geometry CSV, HFSS CSV,
a requests CSV and an output directory. Requests have columns
`band_start_nm,band_end_nm,target_absorption,split`. The split values are
train, validation and test, and each must be nonempty. Requests are unique
across splits. No response data is generated by this tool.

`preparation.load_catalogue` validates IDs, canonical categories, dimensions,
finite absorption in [0,1] and a shared increasing wavelength grid. Repeated
simulation/wavelength rows and duplicate physical designs are rejected.
Rows may arrive in any order. T/R fields are retained as received and are not
used to fill blank absorption. A common grid cannot establish whether every
simulation omitted the same unsupplied wavelengths. Spectral resolution is a
property of the received data.

`flatness.score_band` requires grid-aligned endpoints and computes worst
absolute deviation from X, trapezoidal average absolute deviation divided by
band width, and ripple. `flatness.select_design` minimizes worst error, then
average error, then lexicographic simulation ID. No interpolation or threshold
filtering is applied. A best available approximation may still be poor.

`preparation.prepare_dataset` writes the existing NPZ schema plus
`selection.json`, containing ordered requests, winners and scored alternatives,
and `preparation.json`, containing the objective version `flat_target_v1`,
source/output SHA-256 hashes, class mappings and selection rules. The manifest
is written last. Validation occurs before files are created. Existing
artifact paths are rejected. If saving is interrupted, use a fresh output
directory rather than editing incomplete artifacts.

All request splits share a fixed catalogue. This evaluates new requests over
known simulated designs. It does not claim generalization to unseen physical
geometries. Many derived requests do not increase the count of independent
simulations. Training fingerprints already hash the prepared label arrays and
split indices, so changed labels reject resume under the same run directory.

## Physical evaluation

`data/evaluate_flatness.py` prompts for a baseline/winner model directory,
prepared NPZ, original CSVs and new JSON output. It checks preparation hashes,
loads the best model on GPU 0, predicts test requests and calls
`physical_evaluation.evaluate_predictions`.

Exact geometry, substrate and dimension matches receive scores from their
received spectra. Other predictions receive `requires_simulation` and null
scores. There is no rounding or nearest-design substitution. Exact matching
can be rare with continuous dimension outputs. Those designs require new
simulations or a separately validated forward model.

The JSON includes per-request worst error, average absolute error, ripple and
excess worst error relative to the catalogue optimum for verified designs.
Aggregates cover verified predictions only and are null when none are
verified. Counts explicitly include unverified predictions. There is no
success/failure tolerance and no continuous-band guarantee between samples.

The selection score is an offline physical objective. The neural training
loss remains geometry CE + substrate CE + coordinate Huber with equal
weights, including AutoKeras's corresponding fixed losses. Early stopping and
all architecture searches still minimize supervised validation loss. A
physical loss through predicted dimensions would require a differentiable
forward model, which is not included.
