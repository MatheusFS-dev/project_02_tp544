"""Validate the trained flat Ray and prepare five matched-target HFSS cases."""
from air_only.flat.common import Config, load_config, load_data, device
from dataclasses import asdict, replace
from datetime import datetime
import ast
import csv
import hashlib
import json
from pathlib import Path
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import torch
from tqdm import tqdm
from air_only.flat.training import load_model, evaluate
from air_only.flat.optimize import optimize
from air_only.shared import storage
from air_only.shared.families import NAMES

ROOT = Path(__file__).resolve().parents[3]
RUN = ROOT/'results/flat/ray'
OUTPUT = Path(__file__).resolve().parent
RAW = ROOT/'data/raw/treinar'
plt.rcParams.update({'font.family': 'serif', 'font.size': 10, 'axes.spines.top': False,
                     'axes.spines.right': False, 'axes.linewidth': .6, 'savefig.dpi': 250})


def load_builder(path):
    """Load original HFSS construction functions without executing the batch driver.

    Args:
        path: Received HFSS_Base_Dados.py source file.

    Returns:
        Original material, geometry, boundary and simulation function namespace.
    """
    source = Path(path).read_text(encoding='utf-8-sig')
    namespace = {}
    exec(compile(source.split('AQUI =', 1)[0], str(path), 'exec'), namespace)
    nodes = [node for node in ast.parse(source).body if isinstance(node, ast.FunctionDef)
             or (isinstance(node, ast.Assign) and
                 {item.id for item in ast.walk(node.targets[0]) if isinstance(item, ast.Name)} == {'C0', 'EPS0'})]
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(path), 'exec'), namespace)
    namespace['log'] = lambda message: print(message, flush=True)
    return namespace


def save_figure(figure, name):
    """Save a validation figure as PNG and PDF, then close it.

    Args:
        figure: Matplotlib figure.
        name: Basename inside this case directory.
    """
    for extension in ('png', 'pdf'):
        figure.savefig(OUTPUT/f'{name}.{extension}', bbox_inches='tight')
    plt.close(figure)


def selected_requests():
    """Reuse the five earlier baseline targets without filtering new predictions.

    Returns:
        Five named requests preserving the original bands, targets and provenance.
    """
    path = ROOT/'validation/reference/inverse_baseline_predictions.json'
    previous = json.loads(path.read_text())
    return [dict(case=f'flat_ray_{i:02d}', request=row['request'],
                 previous_case=row['case'], previous_test_position=row['test_position'])
            for i, row in enumerate(previous['cases'], 1)]


def main():
    """Recompute full held-out spectrum errors and optimize five fixed targets."""
    OUTPUT.mkdir(parents=True, exist_ok=True)
    config = replace(load_config('ray'), data=str(RUN/'dataset.npz'))
    gpu = device(config)
    data, metadata = load_data(config.data)
    retained = json.loads((RUN/'final/metrics.json').read_text())
    if retained['dataset_sha256'] != metadata['dataset_sha256']:
        raise ValueError('Ray checkpoint and retained dataset disagree')
    checkpoint_hash = hashlib.sha256((RUN/'final/best.ckpt').read_bytes()).hexdigest()
    model = load_model(RUN/'final', config.device)
    measured = evaluate(model, data, data['test'], config.batch_size, 'all 289 test geometries')
    for key in ('loss', 'absorption_mae_pp', 'mean_worst_spectrum_error_pp', 'p95_worst_spectrum_error_pp'):
        if not np.isclose(measured[key], retained['test'][key], atol=1e-6):
            raise ValueError(f'recomputed test result differs: {key}')
    print('Computing per-geometry and per-family spectrum fidelity', flush=True)
    indices = data['test']
    predictions = []
    with torch.no_grad():
        for start in range(0, len(indices), config.batch_size):
            rows = indices[start:start+config.batch_size]
            predictions.append(model(torch.as_tensor(data['family'][rows], device=gpu),
                                     torch.as_tensor(data['parameters'][rows], device=gpu)).cpu().numpy())
    predictions = np.concatenate(predictions)
    error = np.abs(predictions[..., 2]-data['tra'][indices, :, 2])
    geometry_rows = [dict(source_id=str(data['source_ids'][row]), family=NAMES[data['family'][row]],
                          absorption_mae_pp=float(error[i].mean()*100), worst_error_pp=float(error[i].max()*100))
                     for i, row in enumerate(indices)]
    with (OUTPUT/'test_geometry_errors.csv').open('w') as stream:
        writer = csv.DictWriter(stream, fieldnames=geometry_rows[0].keys())
        writer.writeheader()
        writer.writerows(geometry_rows)
    per_family = {name: dict(count=int((data['family'][indices] == family).sum()),
                  absorption_mae_pp=float(error[data['family'][indices] == family].mean()*100),
                  mean_worst_error_pp=float(error[data['family'][indices] == family].max(-1).mean()*100))
                  for family, name in enumerate(NAMES)}
    storage.save_json(OUTPUT/'spectrum_metrics.json', dict(test=measured, per_family=per_family,
                                                       checkpoint_sha256=checkpoint_hash,
                                                       dataset_sha256=metadata['dataset_sha256']))
    identity = Path(retained['identity']).name
    inventory = json.loads((RUN/'artifact_inventory.json').read_text())
    committed = RUN/inventory['committed_checkpoint']
    if (RUN/'final/best.ckpt').read_bytes() != (committed/'best.ckpt').read_bytes():
        raise ValueError('Export differs from selected Ray committed checkpoint')
    print(f'Verified selected Ray trial {identity}', flush=True)
    history = retained['history']
    figure, ax = plt.subplots(figsize=(7, 3.5))
    for key, label, color in [('train_loss', 'Training', '#53758c'), ('validation_loss', 'Validation', '#9b8270')]:
        ax.plot([row['epoch'] for row in history], [row[key] for row in history], label=label, color=color)
    ax.set(xlabel='Epoch', ylabel='Spectrum training loss')
    ax.legend(frameon=False)
    save_figure(figure, 'training_history')
    figure, axes = plt.subplots(1, 2, figsize=(10, 3.5))
    axes[0].bar(NAMES, [row['absorption_mae_pp'] for row in per_family.values()], color='#53758c')
    axes[0].set(ylabel='Absorption MAE (pp)', xlabel='Test geometry family')
    axes[1].hist(error.max(-1)*100, bins=20, color='#718c80', edgecolor='white')
    axes[1].set(xlabel='Worst spectrum error per test geometry (pp)', ylabel='Geometries')
    axes[0].tick_params(axis='x', rotation=45)
    figure.tight_layout()
    save_figure(figure, 'test_spectrum_errors')
    figure, axes = plt.subplots(5, 1, figsize=(7, 10), sharex=True, sharey=True)
    chosen, families = [], set()
    for position in np.random.default_rng(42).permutation(len(indices)):
        family = int(data['family'][indices[position]])
        if family not in families:
            chosen.append(position)
            families.add(family)
        if len(chosen) == 5:
            break
    for ax, position in zip(axes, chosen):
        row = indices[position]
        ax.plot(data['wavelengths'], data['tra'][row, :, 2], label='Received HFSS', color='#53758c')
        ax.plot(data['wavelengths'], predictions[position, :, 2], label='Surrogate', color='#718c80', linestyle='--')
        ax.set(ylabel='Absorption', ylim=(0, 1.02))
        ax.text(.99, .85, f'{data["source_ids"][row]} / {NAMES[data["family"][row]]}', transform=ax.transAxes, ha='right')
    axes[0].legend(frameon=False)
    axes[-1].set_xlabel('Wavelength (nm)')
    figure.tight_layout()
    save_figure(figure, 'held_out_spectra')
    print('Preparing five optimized geometries with the same targets as the previous baseline', flush=True)
    settings = dict(steps=config.optimization_steps, multistarts=config.multistarts, trust_fraction=config.trust_fraction,
                    tolerance=config.tolerance)
    manifest_path = OUTPUT/'predictions.json'
    if manifest_path.exists():
        manifest = json.loads(manifest_path.read_text())
        if (manifest['checkpoint_sha256'] != checkpoint_hash or manifest['optimization'] != settings
                or [row['request'] for row in manifest['cases']] != [row['request'] for row in selected_requests()]):
            raise ValueError('existing HFSS case manifest differs, preserve the previous validation')
        print('Verified saved immutable five-case manifest, skipping repeated optimization', flush=True)
    else:
        cases = []
        for request in tqdm(selected_requests(), desc='Flat Ray target requests', unit='case'):
            directory = OUTPUT/'optimization'/request['case']
            result = optimize(model, data, config, request['request'], directory)
            prediction = result['candidates'][0]
            reference = result['best_received_training_reference']
            cases.append(dict(**request, prediction=prediction, reference_source_id=reference['source_id'],
                              reference_family=reference['family'], predicted_worst_error_pp=prediction['predicted_worst_error_pp'],
                              predicted_average_error_pp=prediction['predicted_average_error_pp'],
                              predicted_spectrum=str((directory/f'{prediction["family"]}_predicted.csv').relative_to(OUTPUT))))
        manifest = dict(checkpoint_sha256=checkpoint_hash, dataset_sha256=metadata['dataset_sha256'], optimization=settings,
                        selection='same five target requests as earlier inverse baseline, no filtering on new predictions', cases=cases)
        storage.save_json(manifest_path, manifest)
    best_epoch = min(history, key=lambda row: row['validation_loss'])['epoch']
    lines = ['# Flat Ray validation', '', f'Date: {datetime.now().astimezone().isoformat(timespec="seconds")}', '',
             f'Ray selected trial {identity} by validation loss. The selected trial completed {retained["epoch"]} epochs on {retained["train_count"]} training geometries. '
             f'Lowest recorded validation loss occurred at epoch {best_epoch}. The selected checkpoint was verified against its retained dataset.', '',
             f'On all {measured["count"]} held-out geometries, absorption MAE is **{measured["absorption_mae_pp"]:.3f} pp**. '
             f'Mean worst spectrum error is **{measured["mean_worst_spectrum_error_pp"]:.3f} pp**, and the 95th percentile is '
             f'**{measured["p95_worst_spectrum_error_pp"]:.3f} pp**. These describe forward-spectrum fidelity, not flat-target success.', '',
             '![Training history](training_history.png)', '', '![Held-out spectrum errors](test_spectrum_errors.png)', '',
             '![Five held-out examples](held_out_spectra.png)', '',
             'Five design requests preserve the exact wavelength bands and absorption levels used in the previous inverse baseline. '
             'Each is optimized with training-only starts/bounds, and the best predicted candidate is selected by worst target error. '
             'These fixed cases are not a representative physical test estimate. The observed catalogue reference is selected only from training geometries.', '',
             '| Case | Band (nm) | Target A | Chosen family | Predicted worst error (pp) |', '|---|---|---:|---|---:|']
    for case in manifest['cases']:
        low, high, target = case['request']
        lines.append(f'| {case["case"]} | {low:.1f}–{high:.1f} | {target:.2%} | {case["prediction"]["family"]} | {case["predicted_worst_error_pp"]:.3f} |')
    lines += ['', 'The geometric designs and their absorption values above are surrogate predictions. '
              'Actual HFSS spectra and target errors are reported separately after simulation in [ray_hfss.md](ray_hfss.md). '
              'Detailed metrics: [spectrum_metrics.json](spectrum_metrics.json). Cases and hashes: [predictions.json](predictions.json). '
              'Per-test-geometry errors: [test_geometry_errors.csv](test_geometry_errors.csv).', '']
    (OUTPUT/'ray_validation.md').write_text('\n'.join(lines))
    print(f'Validation report saved: {OUTPUT/"ray_validation.md"}', flush=True)


if __name__ == '__main__':
    main()
