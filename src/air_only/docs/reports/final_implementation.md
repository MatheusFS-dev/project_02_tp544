# Final flat workflow implementation

Date: 2026-11-10T10:31:22-03:00

Implemented the user-approved air-only final workflow under `src/air_only/final/`. It retrains each selected flat topology from scratch, without another search, and keeps independent model outputs. The selected AutoKeras topology uses the common PyTorch trainer. Optuna and Ray selected the same topology.

All 2,000 received spectra are retained as 1,926 distinct geometries. The family-stratified split is 1,541 training and 385 validation geometries, with no test examples or overlapping source IDs. Training preserves atomic checkpoints, resume state, batch progress, epoch metrics and logs.

Each inference script asks for band endpoints and target absorption, then prints native geometry dimensions in nm and saves a geometry file. The HFSS runner accepts that file or manual dimensions and copies the received setup into a visible project. It can generate only or generate and simulate. Original received projects were verified unchanged.

Validation: 86 tests passed. Each of the four topologies passed two real-data GPU epochs and inference on the RTX 4070, including baseline interruption/resume. A real original-template HFSS project solved 401 samples with a converged mesh and passive sweep. Arbitrary target endpoints and reuse of completed solver results were checked. Temporary test models, projects and logs were removed.

Full final training has not been run. These checks establish that the workflow works, not final prediction quality. Run preparation and `train_all.py`, then the chosen inference script and `hfss.py`, following [RUN.md](../RUN.md). Details: [GPU smoke](final_smoke.md), [GPU smoke JSON](final_smoke.json), [HFSS smoke JSON](final_hfss_smoke.json).
