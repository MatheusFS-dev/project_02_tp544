"""Simulate in HFSS the joint-model designs for the two examples shown for the air-only models."""
import os
from dataclasses import replace
import json
from pathlib import Path
import numpy as np
from air_only.final import workflow as final_workflow
from air_only.final.hfss import desktop, generate
from air_only.flat.common import logging
from air_only.joint.workflow import configuration, infer
from air_only.shared import storage

OUTPUT = Path(__file__).resolve().parent
EXAMPLES = (('optuna', 1), ('baseline', 3))
INSTALLATION = '/media/matheus.f@local.inatel.br/ssd01/Ansys/AnsysEM25R2/v252/AnsysEM'


def main():
    """Infer each joint design, solve it in the received HFSS setup and save a summary."""
    from air_only.validation.final.run_validation import spectrum_metrics
    config, _, _ = configuration()
    final_settings = final_workflow.configuration()[2]
    settings = dict(final_settings, installation=INSTALLATION)
    os.environ['ANSYSEM_ROOT252'] = INSTALLATION
    if not os.environ.get('ANSYSLMD_LICENSE_FILE'):
        raise RuntimeError('Set ANSYSLMD_LICENSE_FILE before running HFSS')
    requests = {row['example']: row['request'] for row in
                json.loads((OUTPUT.parent/'final/requests.json').read_text())['examples']}
    solver_config = replace(config, output=str(OUTPUT))
    with storage.ownership(OUTPUT/'lock'), logging(replace(config, output=str(OUTPUT)), 'hfss_examples'):
        print('Starting graphical AEDT for joint-model HFSS verification', flush=True)
        os.environ['AEDT_GRPC_PORT'] = str(desktop(settings, OUTPUT/'logs'))
        for case, example in EXAMPLES:
            name = f'example_{example:02d}'
            print(f'Inferring joint {case} {name}', flush=True)
            geometry, path = infer(case, config, requests[name])
            if geometry['substrate'] != 'air':
                raise ValueError('This runner only simulates air-substrate designs')
            physical = {key: geometry[key] for key in ('family', 'substrate', 'tracks', 'parameters_nm', 'request')}
            print(f'Simulating joint {case} {name}: {geometry["family"]} on {geometry["substrate"]}', flush=True)
            state = generate(physical, solver_config, settings, simulate=True)
            spectrum = np.genfromtxt(state['spectrum'], delimiter=',', names=True)
            low, high, target = geometry['request']
            directory = OUTPUT/case/name
            directory.mkdir(parents=True, exist_ok=True)
            summary = dict(case=case, example=name, family=geometry['family'], substrate=geometry['substrate'],
                           band_start_nm=low, band_end_nm=high, target_absorption_percent=target*100,
                           predicted_worst_error_pp=geometry['predicted_worst_error_pp'],
                           **spectrum_metrics(spectrum, geometry['request']),
                           predicted_spectrum=str(path.parent/f'{geometry["family"]}_{geometry["substrate"]}_predicted.csv'),
                           solver=state, geometry=geometry)
            storage.save_json(directory/'summary.json', summary)
            print(f'Joint {case} {name}: HFSS worst error {summary["worst_error_pp"]:.2f} pp '
                  f'(predicted {summary["predicted_worst_error_pp"]:.2f} pp)', flush=True)


if __name__ == '__main__':
    main()
