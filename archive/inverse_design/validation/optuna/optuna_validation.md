# Optuna best-trial validation

Date: 2026-11-09T10:45:08-03:00

Trial 19, selected by minimum validation loss across the completed Optuna study, stopped after 12 epochs with early stopping. Only this selected trial is evaluated here. The best validation loss was 0.8953 at epoch 4, with 70.33% validation family accuracy. Only validation loss was saved per epoch, so no training-loss curve is inferred.

On 1,156 held-out requests, family accuracy is 57.27%, macro family recall is 34.80%, and parameter MAE is 9.24 nm among correct family predictions. Oracle-head MAE is 10.14 nm. Air substrate accuracy is 100%, but the dataset contains only air. The most common test label accounts for 31.49% of requests. Family labels are partition-specific minimax catalogue winners, so family accuracy alone does not establish absorption quality.

![Validation loss](validation_loss.png)

![Confusion matrix](confusion_matrix.png)

![Family recall](family_recall.png)

Five HFSS cases use seed 42 and distinct predicted families, without filtering by correctness. Exact predictions, requests, source rows and checkpoint/data hashes are in [predictions.json](predictions.json). This diversity sample is not a representative physical test estimate.

Physical solver status and spectra are recorded separately in `src/validation/optuna/hfss_status.json` and [optuna_hfss.md](optuna_hfss.md) after simulation. Geometry values are used as predicted, without snapping to the catalogue.
