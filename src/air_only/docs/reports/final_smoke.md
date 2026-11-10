# Final workflow smoke test

Date: 2026-11-10T10:40:17-03:00

All 2000 received sources are retained as 1926 unique geometries. The final dataset has 1541 training and 385 validation geometries, with no test partition.

Each selected topology completed two real-data epochs on NVIDIA GeForce RTX 4070, using 120 training and 36 validation geometries. Baseline interruption/resume and all-family inference succeeded. Temporary model artifacts and logs were removed. This verifies operation, not final model quality. No full final training was performed.
