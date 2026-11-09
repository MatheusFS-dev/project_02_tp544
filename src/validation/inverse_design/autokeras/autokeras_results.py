"""Validate the retained autokeras and prepare five reproducible HFSS cases."""
import ast
from datetime import datetime
import hashlib
import json
import os
from pathlib import Path

os.environ.setdefault('CUDA_VISIBLE_DEVICES', '0')
os.environ['CUDA_DEVICE_ORDER'] = 'PCI_BUS_ID'
os.environ['TF_FORCE_GPU_ALLOW_GROWTH'] = 'true'

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import torch
from inverse_design.core import dataset, metrics, normalize
from inverse_design.training import load_model, predict

ROOT = Path(__file__).resolve().parents[4]
SEARCH = ROOT / 'results/autokeras'
RUN = SEARCH / 'winner'
OUTPUT = Path(__file__).resolve().parent
RAW = ROOT / 'data/raw/treinar'

plt.rcParams.update({'font.family': 'serif', 'font.size': 10, 'axes.spines.top': False,
                     'axes.spines.right': False, 'axes.linewidth': .6, 'savefig.dpi': 250})


def select_cases(predictions, count=5):
    """Select seeded test positions with distinct predicted families.

    Args:
        predictions: Prediction dictionaries in test-split order.
        count: Number of distinct families required.

    Returns:
        Positions in the supplied sequence, in seeded selection order.

    Raises:
        ValueError: Fewer than count distinct families are predicted.
    """
    selected, families = [], set()
    for index in np.random.default_rng(42).permutation(len(predictions)):
        family = predictions[index]['family']
        if family not in families:
            families.add(family)
            selected.append(int(index))
        if len(selected) == count:
            return selected
    raise ValueError(f'Only {len(selected)} predicted families available')


def load_builder(path):
    """Load original construction functions without executing its batch driver.

    Args:
        path: Received HFSS_Base_Dados.py source file.

    Returns:
        Namespace containing the original physical constants and functions.
    """
    source = Path(path).read_text(encoding='utf-8-sig')
    namespace = {}
    exec(compile(source.split('AQUI =', 1)[0], str(path), 'exec'), namespace)
    functions = [node for node in ast.parse(source).body
                 if isinstance(node, ast.FunctionDef)
                 or (isinstance(node, ast.Assign)
                     and {item.id for item in ast.walk(node.targets[0]) if isinstance(item, ast.Name)} == {'C0', 'EPS0'})]
    exec(compile(ast.Module(body=functions, type_ignores=[]), str(path), 'exec'), namespace)
    namespace['log'] = lambda message: print(message, flush=True)
    return namespace


def save_figure(figure, name):
    """Save a figure in PNG and PDF formats and close it.

    Args:
        figure: Matplotlib figure.
        name: Output basename inside the validation directory.
    """
    for suffix in ('png', 'pdf'):
        figure.savefig(OUTPUT / f'{name}.{suffix}', bbox_inches='tight')
    plt.close(figure)


def main():
    """Recompute held-out results, figures and the five-case inference manifest."""
    selection = json.loads((SEARCH / 'complete.json').read_text())
    trial = SEARCH / f"trial-{selection['identity']}"
    OUTPUT.mkdir(parents=True, exist_ok=True)
    print('Loading autokeras best checkpoint and its retained dataset', flush=True)
    model = load_model(RUN)
    data = dataset(SEARCH / 'data.npz')
    indices = data['test']
    requests = data['x'][indices]
    with torch.no_grad():
        outputs = model(torch.tensor(normalize(requests), device='cuda:0'))
    outputs = [value.cpu().numpy() for value in outputs]
    measured = metrics(outputs, data, indices)
    retained = json.loads((RUN / 'metrics.json').read_text())
    if not np.isclose(measured['geometry_accuracy'], retained['test']['geometry_accuracy']):
        raise ValueError('Recomputed accuracy differs from retained result')
    validation_indices = data['validation']
    with torch.no_grad():
        validation_outputs = model(torch.tensor(normalize(data['x'][validation_indices]), device='cuda:0'))
    validation_metrics = metrics([value.cpu().numpy() for value in validation_outputs], data, validation_indices)
    predictions = predict(model, requests)
    truth = data['geometry'][indices]
    guessed = outputs[0].argmax(-1)
    confusion = np.zeros((12, 12), dtype=int)
    np.add.at(confusion, (truth, guessed), 1)
    support = confusion.sum(axis=1)
    recall = np.divide(confusion.diagonal(), support, where=support > 0, out=np.zeros(12))
    print('Plotting validation history and test family performance', flush=True)
    if retained != selection:
        raise ValueError('Winner metrics differ from search completion marker')
    trial_metrics = json.loads((trial / 'metrics.json').read_text())
    if not np.isclose(trial_metrics['best_validation_loss'], selection['best_validation_loss']):
        raise ValueError('Selected trial objective differs from winner objective')
    history = trial_metrics['history']
    if hashlib.sha256((trial / 'best.ckpt').read_bytes()).hexdigest() != hashlib.sha256((RUN / 'best.ckpt').read_bytes()).hexdigest():
        raise ValueError('Winner checkpoint differs from selected trial')
    fig, ax = plt.subplots(figsize=(6, 3.5))
    ax.plot([row['epoch'] for row in history], [row['validation_loss'] for row in history], color='#53758c', marker='o')
    ax.set(xlabel='Epoch', ylabel='Validation loss')
    ax.grid(axis='y', linestyle='--', alpha=.2)
    save_figure(fig, 'validation_loss')
    fig, ax = plt.subplots(figsize=(7, 6))
    image = ax.imshow(confusion, cmap='Blues')
    labels = [f'F{i:02d}' for i in range(1, 13)]
    ax.set(xticks=range(12), yticks=range(12), xticklabels=labels, yticklabels=labels,
           xlabel='Predicted family', ylabel='Catalogue-label family')
    for i in range(12):
        for j in range(12):
            if confusion[i, j]:
                ax.text(j, i, str(confusion[i, j]), ha='center', va='center', fontsize=8,
                        color='white' if confusion[i, j] > confusion.max() / 2 else 'black')
    fig.colorbar(image, ax=ax, label='Test requests')
    save_figure(fig, 'confusion_matrix')
    fig, ax = plt.subplots(figsize=(7, 3.5))
    ax.bar(labels, recall * 100, color='#718c80')
    ax.set(ylabel='Family recall (%)', ylim=(0, 105), xlabel='Catalogue-label family')
    ax.grid(axis='y', linestyle='--', alpha=.2)
    save_figure(fig, 'family_recall')
    checkpoint_hash = hashlib.sha256((RUN / 'best.ckpt').read_bytes()).hexdigest()
    cases = []
    for number, position in enumerate(select_cases(predictions), 1):
        row = int(indices[position])
        cases.append(dict(case=f'autokeras_{number:02d}', test_position=position, dataset_row=row,
                          request=requests[position].tolist(), labelled_family=f'F{truth[position]+1:02d}',
                          label_source_id=str(data['source_ids'][row]), prediction=predictions[position]))
    result = dict(checkpoint_sha256=checkpoint_hash,
                  dataset_sha256=hashlib.sha256((SEARCH / 'data.npz').read_bytes()).hexdigest(),
                  selection='seed 42 shuffled test positions, first five distinct predicted families, no correctness filter',
                  metrics=measured, confusion=confusion.tolist(), support=support.tolist(), cases=cases)
    manifest = OUTPUT / 'predictions.json'
    if manifest.exists() and json.loads(manifest.read_text()) != result:
        raise ValueError('Existing case manifest differs, preserve previous validation separately')
    manifest.write_text(json.dumps(result, indent=2))
    report = OUTPUT / 'autokeras_validation.md'
    text = f'''# AutoKeras best-trial validation

Date: {datetime.now().astimezone().isoformat(timespec='seconds')}

Trial {selection['identity']}, selected by minimum validation loss across the completed AutoKeras study, stopped after {len(history)} epochs with early stopping. Validation family accuracy was recomputed from the exported checkpoint. Only this selected trial is evaluated here. The best validation loss was {retained['best_validation_loss']:.4f} at epoch {min(history, key=lambda row: row['validation_loss'])['epoch']}, with {validation_metrics['geometry_accuracy']:.2%} validation family accuracy. Only validation loss was saved per epoch, so no training-loss curve is inferred.

On {len(indices):,} held-out requests, family accuracy is {measured['geometry_accuracy']:.2%}, macro family recall is {recall.mean():.2%}, and parameter MAE is {measured['correctly_routed_parameter_mae_nm']:.2f} nm among correct family predictions. Oracle-head MAE is {measured['oracle_parameter_mae_nm']:.2f} nm. Air substrate accuracy is 100%, but the dataset contains only air. The most common test label accounts for {support.max()/support.sum():.2%} of requests. Family labels are partition-specific minimax catalogue winners, so family accuracy alone does not establish absorption quality.

![Validation loss](validation_loss.png)

![Confusion matrix](confusion_matrix.png)

![Family recall](family_recall.png)

Five HFSS cases use seed 42 and distinct predicted families, without filtering by correctness. Exact predictions, requests, source rows and checkpoint/data hashes are in [predictions.json](predictions.json). This diversity sample is not a representative physical test estimate.

Physical solver status and spectra are recorded separately in `src/validation/inverse_design/autokeras/hfss_status.json` and [autokeras_hfss.md](autokeras_hfss.md) after simulation. Geometry values are used as predicted, without snapping to the catalogue.
'''
    report.write_text(text)
    print(json.dumps(dict(metrics=measured, cases=[(case['case'], case['prediction']['family']) for case in cases]), indent=2), flush=True)
    print(f'Report saved: {report}', flush=True)


if __name__ == '__main__':
    main()
