"""Exercise joint air + silica training, recovery and inference using real received data."""
from air_only.joint.workflow import configuration, joint_data, train_case, infer, validate_geometry, CASES
from air_only.flat.common import ROOT
from air_only.shared.families import SUBSTRATES
from dataclasses import replace
from datetime import datetime
from pathlib import Path
import json
import tempfile
import torch


def main():
    """Run two GPU epochs per case and remove temporary model artifacts."""
    config, sources, _ = configuration()
    data, metadata = joint_data(config)
    Path(config.output).mkdir(parents=True, exist_ok=True)
    report = dict(timestamp=datetime.now().astimezone().isoformat(timespec='seconds'),
                  gpu=torch.cuda.get_device_name(0), unique_geometries=metadata['unique_designs'],
                  received_spectra=metadata['received_spectra'],
                  splits={key: len(data[key]) for key in ('train', 'validation', 'test')}, cases={})
    with tempfile.TemporaryDirectory(prefix='joint-smoke-', dir=config.output) as temporary:
        settings = replace(config, output=temporary, epochs=2, patience=2, max_train=120, max_eval=36,
                           optimization_steps=8, multistarts=2)
        for case in CASES:
            print(f'Smoke checking joint {case}', flush=True)
            if case == 'baseline':
                first = train_case(case, settings, sources[case], stop_after=1)
                assert first['epoch'] == 1 and not first['completed']
            result = train_case(case, settings, sources[case])
            assert result['epoch'] == 2 and result['completed'] and 'test' not in result
            assert result['architecture']['substrates'] == 2
            assert set(result['validation']['by_substrate']) == set(SUBSTRATES)
            geometry, path = infer(case, settings, [600., 700., .3])
            validate_geometry(geometry)
            candidates = json.loads((path.parent/'candidates.json').read_text())['candidates']
            assert len(candidates) == 24 and geometry['substrate'] in SUBSTRATES
            report['cases'][case] = dict(epoch=result['epoch'], train_count=result['train_count'],
                                        validation_count=result['validation_count'],
                                        validation_by_substrate={name: value['absorption_mae_pp'] for name, value
                                                                 in result['validation']['by_substrate'].items()},
                                        inferred_family=geometry['family'], inferred_substrate=geometry['substrate'])
        report['resume_verified'] = True
    directory = ROOT/'docs/reports'
    (directory/'joint_smoke.json').write_text(json.dumps(report, indent=2)+'\n')
    lines = ['# Joint workflow smoke test', '', f'Date: {report["timestamp"]}', '',
             f'Joint dataset: {metadata["unique_designs"]} unique geometries per substrate, '
             f'{len(data["train"])} training and {len(data["validation"])} validation rows, no test partition.', '',
             f'Each selected topology (with a substrate input) completed two real-data epochs on {report["gpu"]}, '
             'using 120 training and 36 validation rows covering every family and substrate. '
             'Baseline interruption/resume and 24-group (12 families x 2 substrates) inference succeeded. '
             'Temporary artifacts were removed. This verifies operation, not model quality.', '']
    (directory/'joint_smoke.md').write_text('\n'.join(lines))
    print('All four joint cases, checkpoint recovery and inference passed. Report: '+str(directory/'joint_smoke.md'), flush=True)


if __name__ == '__main__':
    main()
