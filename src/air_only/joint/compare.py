"""Compare air-only final models with joint air + silica models."""
from air_only.joint.workflow import configuration, joint_data, infer, CASES
from air_only.flat.common import ROOT, device, logging
from air_only.flat.training import evaluate, load_model
from air_only.shared import storage
from datetime import datetime
import json
from pathlib import Path
from tqdm import tqdm

REPORT = ROOT/'docs/reports/2026-11-25-joint-vs-air'
VALIDATION = ROOT/'validation/final'
METRICS = ('absorption_mae_pp', 'mean_worst_spectrum_error_pp', 'p95_worst_spectrum_error_pp')


def _fit(model, data, rows, batch_size, label):
    metrics = evaluate(model, data, rows, batch_size, label)
    return {key: metrics[key] for key in ('count',)+METRICS}


def fit_comparison(config, extras, data):
    """Evaluate air-only and joint models on the shared air and silica validation rows.

    Args:
        config: Joint settings.
        extras: Resolved reference model paths.
        data: Joint dataset arrays.

    Returns:
        Per-case spectrum errors for air and silica validation rows.

    Raises:
        AssertionError: An air-only model does not reproduce its recorded validation error.
    """
    validation = data['validation']
    air_rows = validation[data['substrate'][validation] == 0]
    silica_rows = validation[data['substrate'][validation] == 1]
    results = {}
    for case in tqdm(CASES, desc='Spectrum fit comparison', unit='case'):
        reference = load_model(extras['references'][case], config.device)
        joint = load_model(joint_directory(config, case), config.device)
        recorded = json.loads((extras['references'][case]/'metrics.json').read_text())['validation']
        air_only = _fit(reference, data, air_rows, config.batch_size, f'{case} air-only on air')
        if abs(air_only['absorption_mae_pp']-recorded['absorption_mae_pp']) > 1e-6 or air_only['count'] != recorded['count']:
            raise AssertionError(f'{case} air-only model does not reproduce its recorded validation error')
        results[case] = dict(
            air=dict(air_only=air_only, joint=_fit(joint, data, air_rows, config.batch_size, f'{case} joint on air')),
            silica=dict(air_only_zero_shot=_fit(reference, data, silica_rows, config.batch_size, f'{case} air-only on silica'),
                        joint=_fit(joint, data, silica_rows, config.batch_size, f'{case} joint on silica')))
    return results


def joint_directory(config, case):
    """Return one case's published joint model directory.

    Args:
        config: Joint settings.
        case: Model case.

    Returns:
        Directory containing best.ckpt and metrics.json.
    """
    return Path(config.output)/case/'final'


def design_comparison(config):
    """Run the five presentation requests with each joint model.

    Args:
        config: Joint settings.

    Returns:
        Per-case, per-request air-only (predicted and HFSS) and joint results.
    """
    examples = json.loads((VALIDATION/'requests.json').read_text())['examples']
    hfss = {(row['case'], row['example']): row for row in json.loads((VALIDATION/'summary.json').read_text())['results']}
    results = {}
    for case in CASES:
        rows = []
        for example in tqdm(examples, desc=f'{case} joint inverse design', unit='request'):
            geometry, path = infer(case, config, example['request'])
            candidates = json.loads((path.parent/'candidates.json').read_text())['candidates']
            best_air = next(c for c in candidates if c['substrate'] == 'air')
            air = hfss[(case, example['example'])]
            rows.append(dict(
                example=example['example'], request=example['request'],
                air_only=dict(family=air['family'], predicted_worst_error_pp=air['predicted_worst_error_pp'],
                              hfss_worst_error_pp=air['worst_error_pp']),
                joint_best=dict(family=geometry['family'], substrate=geometry['substrate'],
                                predicted_worst_error_pp=geometry['predicted_worst_error_pp']),
                joint_best_air=dict(family=best_air['family'], predicted_worst_error_pp=best_air['predicted_worst_error_pp'])))
        results[case] = rows
    return results


def _f(value):
    return f'{value:.2f}'


def write_report(fit, designs, metadata):
    """Write the Markdown and JSON comparison reports.

    Args:
        fit: Output of fit_comparison.
        designs: Output of design_comparison.
        metadata: Joint dataset metadata.
    """
    storage.save_json(REPORT.with_suffix('.json'), dict(fit=fit, designs=designs, dataset_sha256=metadata['dataset_sha256']))
    split = metadata['splits']
    lines = [
        '# Air-only vs joint air + silica models', '',
        f'Date: {datetime.now().astimezone().isoformat(timespec="seconds")}', '',
        'Joint models reuse the four presentation topologies with a substrate input, trained from scratch on '
        f'{metadata["unique_designs"]["air"]} air and {metadata["unique_designs"]["silica"]} silica unique geometries. '
        f'Validation: {split["validation"]["air"]["designs"]} air and {split["validation"]["silica"]["designs"]} silica '
        'geometries. Every geometry keeps its air final partition for both substrates. Single seed (42).', '',
        '## Spectrum fit on validation (absorption error, pp)', '',
        '| Case | Air: air-only MAE | Air: joint MAE | Air: air-only worst | Air: joint worst | '
        'Silica: joint MAE | Silica: joint worst | Silica: air-only zero-shot MAE |',
        '|---|---|---|---|---|---|---|---|']
    for case, row in fit.items():
        lines.append(f'| {case} | {_f(row["air"]["air_only"]["absorption_mae_pp"])} | {_f(row["air"]["joint"]["absorption_mae_pp"])} | '
                     f'{_f(row["air"]["air_only"]["mean_worst_spectrum_error_pp"])} | {_f(row["air"]["joint"]["mean_worst_spectrum_error_pp"])} | '
                     f'{_f(row["silica"]["joint"]["absorption_mae_pp"])} | {_f(row["silica"]["joint"]["mean_worst_spectrum_error_pp"])} | '
                     f'{_f(row["silica"]["air_only_zero_shot"]["absorption_mae_pp"])} |')
    lines += ['', '"Worst" is the mean over spectra of the per-spectrum maximum absorption error. The zero-shot column applies '
              'the air-only model to silica geometries. It is a reference for how far silica spectra are from air, not a model.', '',
              '## Inverse design on the five presentation requests (worst in-band error, pp)', '',
              'Air-only HFSS values come from `validation/final/summary.json`. Joint values are surrogate predictions, '
              'not HFSS-verified.', '',
              '| Case | Request | Air-only family | Air-only predicted | Air-only HFSS | Joint best | Joint predicted | '
              'Joint best air | Joint air predicted |', '|---|---|---|---|---|---|---|---|---|']
    for case, rows in designs.items():
        for row in rows:
            low, high, target = row['request']
            lines.append(f'| {case} | {low:g}-{high:g} nm, {target*100:g}% | {row["air_only"]["family"]} | '
                         f'{_f(row["air_only"]["predicted_worst_error_pp"])} | {_f(row["air_only"]["hfss_worst_error_pp"])} | '
                         f'{row["joint_best"]["family"]} {row["joint_best"]["substrate"]} | '
                         f'{_f(row["joint_best"]["predicted_worst_error_pp"])} | {row["joint_best_air"]["family"]} | '
                         f'{_f(row["joint_best_air"]["predicted_worst_error_pp"])} |')
    lines.append('')
    REPORT.with_suffix('.md').write_text('\n'.join(lines))


def main():
    """Evaluate both model families and write the comparison report."""
    config, _, extras = configuration()
    with logging(config, 'compare'):
        device(config)
        data, metadata = joint_data(config)
        for case in CASES:
            metrics = json.loads((joint_directory(config, case)/'metrics.json').read_text())
            if not metrics['completed'] or metrics['dataset_sha256'] != metadata['dataset_sha256']:
                raise ValueError(f'Joint {case} model is incomplete or belongs to another dataset')
        print('Comparing spectrum fit', flush=True)
        fit = fit_comparison(config, extras, data)
        print('Comparing inverse design on the presentation requests', flush=True)
        designs = design_comparison(config)
        write_report(fit, designs, metadata)
        print(f'Report: {REPORT.with_suffix(".md")}', flush=True)


if __name__ == '__main__':
    main()
