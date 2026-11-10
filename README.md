# Air-only flat absorption design

The active workflow predicts full T/R/A spectra and optimizes geometry to match constant absorption across a requested wavelength band. All received data use **air**. Inverse-design scripts, results and historical documentation are preserved under `archive/inverse_design/`.

Everything active is organized under [`src/air_only/`](src/air_only/):

| Directory | Contents |
|---|---|
| `flat/` | Baseline, Optuna, Ray and AutoKeras training/search and design runners |
| `final/` | Final 80/20 training, four inference scripts and interactive HFSS runner |
| `shared/` | Geometry definitions, real-data loading, checkpoint and logging utilities |
| `configs/` | Complete runner TOMLs |
| `data/` | Received HFSS projects and spectra, plus processed datasets |
| `results/flat/` | Retained selected models and relevant search artifacts |
| `runs/` | Resumable training state, logs and new designs |
| `validation/flat/` | Case-specific scripts, HFSS projects, plots and reports |
| `docs/` | Architecture, commands and implementation reports |
| `tests/` | Active flat/final regression checks |

Install and prepare final training:

```bash
uv sync
source .venv/bin/activate
python3 src/air_only/final/prepare.py
python3 src/air_only/final/train_all.py
```

Infer with one final model, then generate or simulate its geometry:

```bash
python3 src/air_only/final/infer_baseline.py
python3 src/air_only/final/hfss.py
```

| Model | Inference command |
|---|---|
| Baseline | `python3 src/air_only/final/infer_baseline.py` |
| Optuna-selected | `python3 src/air_only/final/infer_optuna.py` |
| Ray-selected | `python3 src/air_only/final/infer_ray.py` |
| AutoKeras-selected | `python3 src/air_only/final/infer_autokeras.py` |

Inference asks for band start/end in nm and target absorption in percent. It prints native geometry dimensions and saves a `geometry.json` file for the HFSS runner. Final training retains all 2,000 source spectra as 1,926 unique geometries, split into 1,541 training and 385 validation geometries with no test partition. The earlier comparison experiments retain their original 70/15/15 split. Training prints batch/epoch progress, mirrors logs and resumes from atomic checkpoints.

All supported training/search, smoke, inference and validation commands are in [`src/air_only/docs/RUN.md`](src/air_only/docs/RUN.md). Architecture is explained in [`flat_architecture.md`](src/air_only/docs/flat_architecture.md).

Run active checks:

```bash
pytest -q
python3 src/air_only/final/smoke.py
```

The default is physical GPU 0, logical `cuda:0`. This PC's RTX 4070 can be selected before running Python with `export CUDA_VISIBLE_DEVICES=1`.
