"""Short real-data GPU checks of all flat-spectrum training and design runners."""
from air_only.flat.common import ROOT, load_config, load_data, logging, device, final_directory
from dataclasses import replace
from datetime import datetime
from pathlib import Path
import hashlib
import tempfile
import numpy as np
from air_only.shared import storage
from air_only.flat.prepare import prepare
from air_only.flat.training import train, load_model
from air_only.flat.optimize import optimize
from air_only.flat.cases.baseline.train import run as baseline_run
from air_only.flat.cases.optuna.train import run as optuna_run
from air_only.flat.cases.ray.train import run as ray_run


def main():
    """Verify preparation, real GPU training, resume, searches and optimization."""
    config = load_config('smoke')
    gpu = device(config)
    prepare(config)
    data, metadata = load_data(config.data)
    source_sets = [set(metadata['splits'][key]['source_ids']) for key in ('train', 'validation', 'test')]
    assert len(set.union(*source_sets)) == metadata['received_spectra'] == 2000
    assert all(not source_sets[i] & source_sets[j] for i in range(3) for j in range(i))
    report = dict(timestamp=datetime.now().astimezone().isoformat(timespec='seconds'),
                  received_spectra=metadata['received_spectra'], unique_designs=metadata['unique_designs'],
                  split_counts={key: len(data[key]) for key in ('train', 'validation', 'test')},
                  dataset_sha256=metadata['dataset_sha256'])
    report_directory = ROOT/'validation/flat/smoke'
    report_directory.mkdir(parents=True, exist_ok=True)
    Path(config.output).mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='flat-smoke-', dir=config.output) as temporary:
        settings = replace(config, output=temporary)
        with logging(settings, 'smoke'):
            import torch
            report['gpu'] = torch.cuda.get_device_name(gpu)
            print('Smoke stage: baseline epoch 1, deliberate interruption, then resume to epoch 2', flush=True)
            directory = Path(temporary)/'baseline'/'training'
            first = train(directory, settings, stop_after=1)
            first_checkpoint = (directory/'best.ckpt').read_bytes()
            resumed = train(directory, settings)
            assert first['epoch'] == 1 and resumed['epoch'] == settings.epochs == 2
            assert len(resumed['history']) == 2
            print('Smoke stage: recover a stale best-model file from the latest durable epoch', flush=True)
            storage.atomic(directory/'best.ckpt', first_checkpoint)
            train(directory, settings)
            expected = storage.load(directory)['best_weights']
            actual = storage.unpack(directory/'best.ckpt')['weights']
            assert all(torch.equal(expected[key], actual[key]) for key in expected)
            report['baseline'] = baseline_run(settings)
            report['resume_verified'] = True
            print('Smoke stage: two Optuna architecture trials', flush=True)
            report['optuna'] = optuna_run(settings)
            print('Smoke stage: two Ray architecture trials', flush=True)
            try:
                report['ray'] = ray_run(settings)
            finally:
                import ray
                ray.shutdown()
            print('Smoke stage: two genuine AutoKeras spectrum trials', flush=True)
            from air_only.flat.cases.autokeras.train import run as autokeras_run
            report['autokeras'] = autokeras_run(settings)
            print('Smoke stage: all-family flat-target optimization for each trained method', flush=True)
            request = [float(data['wavelengths'][40]), float(data['wavelengths'][320]), .3]
            report['optimization'] = {}
            report['final_models'] = {}
            for method in ('baseline', 'optuna', 'autokeras', 'ray'):
                model_directory = final_directory(settings, method)
                report['final_models'][method] = dict(relative_path=f'{method}/final/best.ckpt',
                    checkpoint_sha256=hashlib.sha256((model_directory/'best.ckpt').read_bytes()).hexdigest())
                result = optimize(load_model(model_directory), data, settings, request,
                                  Path(temporary)/method/'designs'/'smoke')
                assert len(result['candidates']) == 12
                assert len({row['family'] for row in result['candidates']}) == 12
                assert all(np.isfinite(row['predicted_worst_error_pp']) for row in result['candidates'])
                for row in result['candidates']:
                    from air_only.shared.families import SCALES, MASK, NAMES
                    parameters = np.array(row['normalized_parameters'])*SCALES
                    assert (parameters >= np.array(row['trust_lower_nm'])-1e-4).all()
                    assert (parameters <= np.array(row['trust_upper_nm'])+1e-4).all()
                    assert np.all(parameters[MASK[NAMES.index(row['family'])] == 0] == 0)
                    assert row['predicted_worst_error_pp'] <= row['initial_best_predicted_worst_error_pp']+1e-6
                report['optimization'][method] = dict(best_family=result['candidates'][0]['family'],
                        predicted_worst_error_pp=result['candidates'][0]['predicted_worst_error_pp'],
                        families_checked=12, request=request)
            print('All GPU smoke stages passed. Temporary smoke checkpoints and logs will be removed.', flush=True)
    storage.save_json(report_directory/'smoke.json', report)
    lines = ['# Flat-absorption GPU smoke test', '', f'Date: {report["timestamp"]}', '',
             f'GPU: {report["gpu"]}. All {metadata["received_spectra"]} received spectra were validated and grouped into '
             f'{metadata["unique_designs"]} unique geometries. Full split: {report["split_counts"]}.', '',
             f'Training used only {config.max_train} training and {config.max_eval} validation/test geometries, '
             'balanced across all twelve families, for two epochs. These are pipeline checks, not production accuracy results.', '',
             '| Method | Smoke test absorption MAE (pp) | Mean worst spectrum error (pp) |',
             '|---|---:|---:|']
    for method in ('baseline', 'optuna', 'autokeras', 'ray'):
        metrics = report[method]['test']
        lines.append(f'| {method} | {metrics["absorption_mae_pp"]:.3f} | {metrics["mean_worst_spectrum_error_pp"]:.3f} |')
    lines += ['', 'Passed: epoch checkpoint resume from 1 to 2, recovery of a stale best-model file, '
              'two actual Optuna trials, two genuine AutoKeras trials, two actual Ray trials, '
              'four independent final-model exports, test evaluation after winner selection, '
              'and twelve-family minimax optimization for each method. '
              'T/R/A predictions conserve power. Optimized candidates are surrogate predictions requiring HFSS verification. '
              'Temporary smoke checkpoints and logs were removed. Prepared real training data remain available.', '',
              'Detailed evidence: [smoke.json](smoke.json).', '']
    (report_directory/'smoke.md').write_text('\n'.join(lines))
    print(f'Smoke report saved: {report_directory/"smoke.md"}', flush=True)


if __name__ == '__main__':
    main()
