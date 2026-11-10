"""Exercise final training, recovery and inference using real received data."""
from air_only.final.workflow import configuration, final_data, train_case, infer, CASES, ROOT, validate_geometry
from dataclasses import replace
from datetime import datetime
from pathlib import Path
import json
import tempfile
import torch


def main():
    """Run two GPU epochs per case and remove temporary model artifacts."""
    config, sources, _ = configuration()
    data, metadata = final_data(config)
    Path(config.output).mkdir(parents=True, exist_ok=True)
    report = dict(timestamp=datetime.now().astimezone().isoformat(timespec='seconds'),
                  gpu=torch.cuda.get_device_name(0),
                  received_spectra=metadata['received_spectra'], unique_geometries=metadata['unique_designs'],
                  splits={key: len(data[key]) for key in ('train', 'validation', 'test')}, cases={})
    with tempfile.TemporaryDirectory(prefix='final-smoke-', dir=config.output) as temporary:
        settings = replace(config, output=temporary, epochs=2, patience=2, max_train=120, max_eval=36,
                           optimization_steps=8, multistarts=2)
        for case in CASES:
            if case == 'baseline':
                first = train_case(case, settings, sources[case], stop_after=1)
                assert first['epoch'] == 1 and not first['completed']
            result = train_case(case, settings, sources[case])
            assert result['epoch'] == 2 and result['completed'] and 'test' not in result
            geometry, path = infer(case, settings, [600., 700., .3])
            validate_geometry(geometry)
            assert path.exists() and geometry['substrate'] == 'air'
            report['cases'][case] = dict(epoch=result['epoch'], train_count=result['train_count'],
                                        validation_count=result['validation_count'],
                                        validation_absorption_mae_pp=result['validation']['absorption_mae_pp'],
                                        inferred_family=geometry['family'])
        report['resume_verified'] = True
    directory = ROOT/'docs/reports'
    directory.mkdir(parents=True, exist_ok=True)
    (directory/'final_smoke.json').write_text(json.dumps(report, indent=2)+'\n')
    lines = ['# Final workflow smoke test', '', f'Date: {report["timestamp"]}', '',
             f'All {metadata["received_spectra"]} received sources are retained as {metadata["unique_designs"]} unique geometries. '
             f'The final dataset has {len(data["train"])} training and {len(data["validation"])} validation geometries, with no test partition.', '',
             f'Each selected topology completed two real-data epochs on {report["gpu"]}, using 120 training and 36 validation geometries. '
             'Baseline interruption/resume and all-family inference succeeded. Temporary model artifacts and logs were removed. '
             'This verifies operation, not final model quality. No full final training was performed.', '']
    (directory/'final_smoke.md').write_text('\n'.join(lines))
    print('All four final cases, checkpoint recovery and inference passed. Report: '+str(directory/'final_smoke.md'), flush=True)


if __name__ == '__main__':
    main()
