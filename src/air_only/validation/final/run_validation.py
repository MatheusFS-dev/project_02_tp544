"""Run the four final models on five fixed dataset-supported absorption targets."""
from dataclasses import asdict, replace
from datetime import datetime
import csv
import hashlib
import json
import os
from pathlib import Path

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from tqdm import tqdm

from air_only.final.workflow import configuration, final_data, geometry_text, validate_geometry, CASES
from air_only.final.hfss import generate, desktop, score_actual
from air_only.flat.common import device, logging
from air_only.flat.optimize import optimize
from air_only.flat.training import load_model
from air_only.shared import storage


OUTPUT = Path(__file__).resolve().parent
REQUESTS = ((500., 510., .40), (600., 620., .30), (750., 780., .25),
            (1000., 1040., .20), (1250., 1300., .15))


def physical_geometry(geometry):
    """Return the exact solver input without model-specific provenance.

    Args:
        geometry: Inferred geometry with native dimensions and target request.

    Returns:
        Physical geometry and request, suitable for a shared HFSS solve.
    """
    validate_geometry(geometry)
    return {key: geometry[key] for key in ('family', 'substrate', 'tracks', 'parameters_nm', 'request')}


def spectrum_metrics(spectrum, request):
    """Validate an actual spectrum and score interpolated target-band endpoints.

    Args:
        spectrum: Structured array containing lambda_nm, T, R and A fractions.
        request: Band endpoints in nm and target absorption fraction.

    Returns:
        Actual target errors and in-band absorption extrema in percent.

    Raises:
        ValueError: The spectrum is nonfinite, nonpassive or violates power balance.
    """
    values = np.column_stack([spectrum[key] for key in ('T', 'R', 'A')])
    if (not np.isfinite(values).all() or np.any(values < -.001) or np.any(values > 1.001)
            or not np.allclose(values.sum(1), 1, atol=1e-8)):
        raise ValueError('Invalid actual HFSS spectrum')
    grid = spectrum['lambda_nm']
    scores = score_actual(grid, spectrum['A'], request)
    low, high, _ = request
    points = np.r_[low, grid[(grid > low) & (grid < high)], high]
    absorption = np.interp(points, grid, spectrum['A'])*100
    return dict(**scores, band_min_absorption_percent=float(absorption.min()),
                band_max_absorption_percent=float(absorption.max()))


def prepare_requests(data, metadata):
    """Save training-only evidence supporting the five fixed requests.

    Args:
        data: Validated final dataset arrays.
        metadata: Dataset provenance and checksum.

    Returns:
        Request records with best received source and support counts.
    """
    rows = []
    for number, request in enumerate(REQUESTS, 1):
        scores = []
        for index in data['train']:
            value = score_actual(data['wavelengths'], data['tra'][index, :, 2], request)
            scores.append((value['worst_error_pp'], value['mean_error_pp'], int(index)))
        scores.sort()
        best = scores[0]
        supported = [row for row in scores if row[0] <= 2]
        rows.append(dict(example=f'example_{number:02d}', request=list(request),
                         width_nm=request[1]-request[0],
                         training_geometries_within_2pp=len(supported),
                         supported_families=sorted({f'F{int(data["family"][row[2]])+1:02d}' for row in supported}),
                         best_received_source=str(data['source_ids'][best[2]]),
                         best_received_family=f'F{int(data["family"][best[2]])+1:02d}',
                         best_received_worst_error_pp=best[0]))
    storage.save_json(OUTPUT/'requests.json', dict(dataset_sha256=metadata['dataset_sha256'],
        selection='Five fixed 10–50 nm bands with rounded targets supported by actual training spectra. '
                  'Chosen before new inferences, without using validation rows or model predictions.',
        train_count=len(data['train']), examples=rows))
    return rows


def run_inferences(config, data, metadata, requests):
    """Run or resume all twenty independent model/request inferences.

    Args:
        config: Unchanged final workflow settings.
        data: Validated final real-data arrays.
        metadata: Dataset provenance.
        requests: Five fixed request records.

    Returns:
        Case, example, output directory and geometry records.
    """
    jobs = []
    device(config)
    for case in CASES:
        model_path = Path(config.output)/case/'final'
        metrics = json.loads((model_path/'metrics.json').read_text())
        if not metrics['completed'] or metrics['dataset_sha256'] != metadata['dataset_sha256']:
            raise ValueError(f'Incomplete or incompatible final model: {case}')
        checkpoint = hashlib.sha256((model_path/'best.ckpt').read_bytes()).hexdigest()
        model = load_model(model_path, config.device)
        for record in tqdm(requests, desc=f'Inference: {case}', unit='request'):
            example = record['example']
            request = record['request']
            directory = OUTPUT/case/example
            directory.mkdir(parents=True, exist_ok=True)
            storage.manifest(directory, dict(case=case, request=request, checkpoint_sha256=checkpoint,
                                             dataset_sha256=metadata['dataset_sha256'], config=asdict(config)))
            path = directory/'design/geometry.json'
            if path.exists():
                print(f'Resuming retained inference: {case}/{example}', flush=True)
                geometry = json.loads(path.read_text())
                if (geometry['checkpoint_sha256'] != checkpoint or geometry['request'] != request
                        or geometry['case'] != case or geometry['dataset_sha256'] != metadata['dataset_sha256']):
                    raise ValueError(f'Incompatible retained inference: {path}')
                validate_geometry(geometry)
            else:
                with logging(replace(config, output=str(directory)), 'inference'):
                    print(f'Inferring {case}/{example}: {request}', flush=True)
                    result = optimize(model, data, config, request, directory/'design')
                    candidate = result['candidates'][0]
                    geometry = dict(physical_geometry(dict(candidate, request=request)), case=case,
                                    checkpoint_sha256=checkpoint, dataset_sha256=metadata['dataset_sha256'],
                                    predicted_worst_error_pp=candidate['predicted_worst_error_pp'])
                    storage.save_json(path, geometry)
                    (directory/'design/geometry.txt').write_text(geometry_text(geometry)+'\n')
            jobs.append((case, example, directory, geometry))
    return jobs


def plot_result(directory, geometry, spectrum):
    """Save full simulated T/R/A and detailed actual-versus-predicted absorption.

    Args:
        directory: Case/example output directory.
        geometry: Inference request and selected geometry.
        spectrum: Verified actual HFSS spectrum.
    """
    low, high, target = geometry['request']
    predicted = np.genfromtxt(directory/'design'/f'{geometry["family"]}_predicted.csv',
                             delimiter=',', names=True)
    title = f'{geometry["case"]}: {geometry["family"]}, {low:g}–{high:g} nm'
    for kind in ('TRA', 'absorption_band'):
        figure, ax = plt.subplots(figsize=(7.2, 4.4))
        if kind == 'TRA':
            for name, color in zip(('T', 'R', 'A'), ('#53758c', '#9b8270', '#718c80')):
                ax.plot(spectrum['lambda_nm'], spectrum[name]*100, label=f'Actual {name}', color=color, lw=1.6)
            ax.set(xlim=(spectrum['lambda_nm'][0], spectrum['lambda_nm'][-1]),
                   ylim=(0, 100), ylabel='Power (%)')
        else:
            ax.plot(spectrum['lambda_nm'], spectrum['A']*100, color='#718c80', label='Actual HFSS A')
            ax.plot(predicted['lambda_nm'], predicted['A']*100, color='#53758c', ls='--', label='Predicted A')
            margin = max(10, (high-low)*.5)
            ax.set(xlim=(low-margin, high+margin), ylim=(0, 100), ylabel='Absorption (%)')
        ax.axvspan(low, high, color='#777777', alpha=.08, label='Requested band')
        ax.plot([low, high], [target*100]*2, color='#444444', ls=':', label=f'Target {target*100:g}%')
        ax.set(xlabel='Wavelength (nm)', title=title)
        ax.legend(ncol=3, fontsize=9, loc='upper center', bbox_to_anchor=(.5, -.2))
        figure.tight_layout()
        for extension in ('png', 'pdf'):
            figure.savefig(directory/f'{kind}.{extension}', dpi=300, bbox_inches='tight')
        plt.close(figure)


def summarize(rows, requests):
    """Publish partial or complete comparison tables and the final ranking plot.

    Args:
        rows: Completed model/request metrics.
        requests: Five fixed request records with data support.
    """
    storage.save_json(OUTPUT/'summary.json', dict(completed=len(rows), expected=20, results=rows))
    with (OUTPUT/'comparison.csv').open('w', newline='') as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    lines = ['# Final models: five narrow-band HFSS validations', '',
             datetime.now().astimezone().isoformat(timespec='seconds'), '',
             f'Completed {len(rows)}/20 model/request validations. Air substrate only. '
             'The original gold material, periodic boundaries, ports and 401-point sweep were retained.', '',
             'Targets were fixed using real training spectra before new model inference. '
             'This is a dataset-supported demonstration, not an unseen test set. '
             'Each case uses its own final retrained model and searches all twelve families.', '',
             '| Example | Band (nm) | Target A | Training spectra within ±2 pp |',
             '|---|---|---:|---:|']
    for record in requests:
        low, high, target = record['request']
        lines.append(f'| {record["example"]} | {low:g}–{high:g} | {target*100:g}% | '
                     f'{record["training_geometries_within_2pp"]} |')
    lines += ['', '| Model | Example | Family | Predicted worst error (pp) | HFSS worst error (pp) | HFSS mean error (pp) | Plots/report |',
              '|---|---|---|---:|---:|---:|---|']
    for row in rows:
        link = f'{row["case"]}/{row["example"]}'
        lines.append(f'| {row["case"]} | {row["example"]} | {row["family"]} | '
                     f'{row["predicted_worst_error_pp"]:.3f} | {row["worst_error_pp"]:.3f} | '
                     f'{row["mean_error_pp"]:.3f} | [T/R/A]({link}/TRA.png), [band]({link}/absorption_band.png), '
                     f'[report]({link}/report.md) |')
    if len(rows) == 20:
        ranking = []
        for case in CASES:
            values = [row for row in rows if row['case'] == case]
            ranking.append((np.mean([row['worst_error_pp'] for row in values]), case,
                            sum(row['worst_error_pp'] <= 5 for row in values)))
        ranking.sort()
        lines += ['', '| Model | Mean HFSS worst target error (pp) | Cases within ±5 pp |', '|---|---:|---:|']
        lines += [f'| {case} | {error:.3f} | {count}/5 |' for error, case, count in ranking]
        winners = ', '.join(case for error, case, _ in ranking if abs(error-ranking[0][0]) <= 1e-12)
        lines += ['', f'Best mean physical target matching on these five examples: **{winners}**. '
                  'This small demonstration does not establish general superiority.', '',
                  f'All mesh and sweep checks converged: {all(row["mesh_converged"] and row["sweep_converged_and_passive"] for row in rows)}.',
                  f'Unique physical solves: {len({row["hfss_project"] for row in rows})}. '
                  'Exactly identical geometry/request inputs share a real HFSS solution, with a link in each example. '
                  'Optuna and Ray final model tensors are identical, despite different checkpoint-file hashes.', '',
                  'Every example contains native geometry JSON/text, twelve candidate spectra, T/R/A and band-detail PNG/PDF plots, '
                  'a solver-status summary and an HFSS directory link. Raw solved spectra and AEDT projects are under `hfss/`.', '']
        fig, ax = plt.subplots(figsize=(7, 4))
        colors = ('#53758c', '#718c80', '#9b8270', '#8b8193')
        for number, (case, color) in enumerate(zip(CASES, colors)):
            values = [row['worst_error_pp'] for row in rows if row['case'] == case]
            ax.bar(np.arange(5)+(number-1.5)*.2, values, width=.19, label=case, color=color)
        ax.axhline(5, color='#444444', ls=':', lw=1, label='±5 pp threshold')
        ax.set(xticks=np.arange(5), xticklabels=[f'Example {i}' for i in range(1, 6)],
               ylabel='Worst target error (pp)', title='Actual HFSS absorption-target matching')
        ax.legend(ncol=3, fontsize=9, loc='upper center', bbox_to_anchor=(.5, -.16))
        fig.tight_layout()
        for extension in ('png', 'pdf'):
            fig.savefig(OUTPUT/f'comparison.{extension}', dpi=300, bbox_inches='tight')
        plt.close(fig)
    (OUTPUT/'SUMMARY.md').write_text('\n'.join(lines)+'\n')


def main():
    """Resume the complete real-data inference and graphical HFSS experiment."""
    config, _, settings = configuration()
    with storage.ownership(OUTPUT), logging(replace(config, output=str(OUTPUT)), 'validation'):
        print('Verifying final data and fixed requests', flush=True)
        data, metadata = final_data(config)
        storage.manifest(OUTPUT, dict(requests=[list(row) for row in REQUESTS], dataset_sha256=metadata['dataset_sha256'],
                                     config=asdict(config), hfss=settings))
        requests = prepare_requests(data, metadata)
        plt.rcParams.update({'font.family': 'DejaVu Serif', 'font.size': 11,
                             'axes.spines.top': False, 'axes.spines.right': False,
                             'axes.linewidth': .7, 'figure.facecolor': 'white',
                             'axes.facecolor': 'white', 'legend.frameon': False})
        print('Running all four models on the same five fixed requests', flush=True)
        jobs = run_inferences(config, data, metadata, requests)
        print('Starting graphical HFSS validation of all twenty model proposals', flush=True)
        os.environ['ANSYSEM_ROOT252'] = settings['installation']
        os.environ['AEDT_GRPC_PORT'] = str(desktop(settings, OUTPUT/'logs'))
        solver_config = replace(config, output=str(OUTPUT))
        completed = []
        for case, example, directory, geometry in tqdm(jobs, desc='HFSS validation', unit='proposal'):
            print(f'Simulating {case}/{example}: {geometry["family"]}', flush=True)
            with logging(replace(config, output=str(directory)), 'hfss'):
                state = generate(physical_geometry(geometry), solver_config, settings, simulate=True)
            spectrum_path = Path(state['spectrum'])
            spectrum = np.genfromtxt(spectrum_path, delimiter=',', names=True)
            if len(spectrum) != 401:
                raise ValueError(f'Expected the original 401-point HFSS spectrum: {spectrum_path}')
            scores = spectrum_metrics(spectrum, geometry['request'])
            link = directory/'hfss'
            if not link.exists():
                link.symlink_to(os.path.relpath(spectrum_path.parent, directory), target_is_directory=True)
            elif link.resolve() != spectrum_path.parent.resolve():
                raise ValueError(f'Unexpected retained HFSS link: {link}')
            low, high, target = geometry['request']
            row = dict(case=case, example=example, family=geometry['family'], band_start_nm=low,
                       band_end_nm=high, target_absorption_percent=target*100,
                       predicted_worst_error_pp=geometry['predicted_worst_error_pp'], **scores,
                       mesh_converged=state['mesh_converged'],
                       sweep_converged_and_passive=state['sweep_converged_and_passive'],
                       hfss_project=state['project'])
            storage.save_json(directory/'summary.json', dict(**row, solver=state, geometry=geometry))
            plot_result(directory, geometry, spectrum)
            report = ['# Final geometry: actual HFSS validation', '',
                      datetime.now().astimezone().isoformat(timespec='seconds'), '',
                      geometry_text(geometry), '', f'Target: {target*100:g}% absorption over {low:g}–{high:g} nm.', '',
                      f'Actual absorption in band: {scores["band_min_absorption_percent"]:.3f}–{scores["band_max_absorption_percent"]:.3f}%.',
                      f'Actual worst target error: {scores["worst_error_pp"]:.3f} pp. Mean error: {scores["mean_error_pp"]:.3f} pp.',
                      f'Predicted worst target error: {geometry["predicted_worst_error_pp"]:.3f} pp.',
                      f'Mesh converged: {state["mesh_converged"]}. Sweep converged and passive: {state["sweep_converged_and_passive"]}.', '',
                      '[T/R/A PNG](TRA.png) · [PDF](TRA.pdf) · [Band detail](absorption_band.png)', '',
                      f'HFSS project: [{Path(state["project"]).name}](hfss/{Path(state["project"]).name}). '
                      '[Actual spectrum](hfss/spectrum.csv). Identical physical inputs share a solver directory.', '']
            (directory/'report.md').write_text('\n'.join(report))
            completed.append(row)
            summarize(completed, requests)
            print(f'Completed {len(completed)}/20: actual worst error {scores["worst_error_pp"]:.3f} pp', flush=True)
        print(f'All twenty validations complete. Summary: {OUTPUT/"SUMMARY.md"}', flush=True)


if __name__ == '__main__':
    main()
