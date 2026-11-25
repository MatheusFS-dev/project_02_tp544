# Joint workflow smoke test

Date: 2026-11-25T14:26:38-03:00

Joint dataset: {'air': 1926, 'silica': 1839} unique geometries per substrate, 3014 training and 751 validation rows, no test partition.

Each selected topology (with a substrate input) completed two real-data epochs on NVIDIA GeForce RTX 4070, using 120 training and 36 validation rows covering every family and substrate. Baseline interruption/resume and 24-group (12 families x 2 substrates) inference succeeded. Temporary artifacts were removed. This verifies operation, not model quality.
