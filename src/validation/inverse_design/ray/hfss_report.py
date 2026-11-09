"""Summarize only exported spectra and native solver convergence evidence."""
from datetime import datetime
import hashlib
import json
import re
import numpy as np

from ray_results import OUTPUT, RAW, ROOT, plt, save_figure
from inverse_design.flatness import score_band


def main():
    """Plot physical comparisons and report source and convergence diagnostics."""
    root = ROOT
    print('Checking original source hashes and exported solver evidence', flush=True)
    original = json.loads((RAW / 'import_manifest.json').read_text())
    for item in original['files']:
        if item['path'].endswith(('.aedt', '.py')):
            if hashlib.sha256((RAW / item['path']).read_bytes()).hexdigest() != item['sha256']:
                raise ValueError(f"Original source hash changed: {item['path']}")
    manifest = json.loads((OUTPUT / 'predictions.json').read_text())
    status = json.loads((OUTPUT / 'hfss_status.json').read_text())
    fig, axes = plt.subplots(5, 1, figsize=(7, 10), sharex=True, sharey=True)
    rows = []
    print('Comparing predicted spectra with original held-out catalogue labels', flush=True)
    for case, ax in zip(manifest['cases'], axes):
        key = case['case']
        entry = status[key]
        if entry['stage'] != 'solved':
            ax.text(.5, .5, f'{key}: {entry["stage"]}', transform=ax.transAxes, ha='center')
            continue
        directory = OUTPUT / key
        spectrum = np.genfromtxt(directory / 'spectrum.csv', delimiter=',', names=True)
        reference = np.genfromtxt(RAW / 'Espectros_TRA' / f'{case["label_source_id"]}.csv', delimiter=',', names=True)
        catalogue_score = score_band(reference['lambda_nm'], reference['A'], np.array(case['request']))
        profiles = list((directory / f'{key}.aedtresults' / f'{key}.results').glob('*.profile'))
        profile = '\n'.join(path.read_text(errors='replace') for path in profiles)
        archived_profile = directory / 'solver_profile.txt'
        if profile:
            archived_profile.write_text(profile)
        elif archived_profile.exists():
            print(f'{key}: reading archived native solver profile', flush=True)
            profile = archived_profile.read_text()
        delta_values = re.findall(r'Max Mag\. Delta S.*?, ([0-9.eE+-]+),', profile)
        details = dict(case=key, predicted_family=case['prediction']['family'],
                       labelled_family=case['labelled_family'], label_source_id=case['label_source_id'],
                       request=case['request'], prediction=case['prediction'],
                       spectrum_sha256=hashlib.sha256((directory / 'spectrum.csv').read_bytes()).hexdigest(),
                   solver_profile_sha256=hashlib.sha256(profile.encode()).hexdigest() if profile else None,
                       mesh_converged='Adaptive Passes converged' in profile if profile else None,
                       sweep_converged_and_passive='Interpolating sweep converged and is passive' in profile if profile else None,
                       final_adaptive_delta_s=float(delta_values[-1]) if delta_values else None,
                       physical_scores=entry['result'], catalogue_scores=catalogue_score,
                       excess_worst_error=entry['result']['worst_error']-catalogue_score['worst_error'])
        if len(spectrum) != 401 or not np.isfinite(np.array([spectrum[name] for name in spectrum.dtype.names])).all():
            raise ValueError(f'Expected 401 finite spectral samples for {key}')
        (directory / 'diagnostics.json').write_text(json.dumps(details, indent=2))
        rows.append(details)
        low, high, target = case['request']
        ax.plot(spectrum['lambda_nm'], spectrum['A'], color='#718c80', label='HFSS model prediction')
        ax.plot(reference['lambda_nm'], reference['A'], color='#53758c', linestyle=':', label='Held-out catalogue label')
        ax.plot([low, high], [target, target], color='#444444', linestyle='--', label='Requested A')
        ax.axvspan(low, high, color='#777777', alpha=.07)
        ax.set(ylabel='Absorption', ylim=(0, 1.02))
        ax.text(.99, .88, f'{key}: {case["prediction"]["family"]}, label {case["labelled_family"]}', transform=ax.transAxes, ha='right', fontsize=9)
    axes[0].legend(frameon=False, loc='upper left', fontsize=8)
    axes[-1].set_xlabel('Wavelength (nm)')
    fig.tight_layout()
    save_figure(fig, 'absorption_comparison')
    (OUTPUT / 'physical_summary.json').write_text(json.dumps(rows, indent=2))
    print('Writing concise physical validation report', flush=True)
    lines = ['# Ray best-trial HFSS results', '', f'Date: {datetime.now().astimezone().isoformat(timespec="seconds")}', '',
             f'{len(rows)}/5 predicted geometries have exported 401-point HFSS spectra. The five separate AEDT projects remain open in the graphical desktop. Original received project and builder hashes were checked and are unchanged.', '',
             'Cases are the first five distinct predicted families in a seed-42 shuffle of the test split. Predictions are used without clipping, rounding or catalogue snapping. The original 320 nm period, 30 nm gold, air, normal incidence, four Floquet modes per port, material dispersion, adaptive settings and frequency sweep are preserved. T/R/A are averaged over the two incident polarizations.', '',
             '| Case | Family (predicted / label) | Worst error (pp) | Mean error (pp) | Catalogue worst (pp) | Mesh / sweep converged |',
             '|---|---|---:|---:|---:|---|']
    for row in rows:
        score = row['physical_scores']
        project_link = f'[{row["case"]}]({row["case"]}/{row["case"]}.aedt)'
        lines.append(f'| {project_link} | {row["predicted_family"]} / {row["labelled_family"]} | {100*score["worst_error"]:.2f} | {100*score["average_error"]:.2f} | {100*row["catalogue_scores"]["worst_error"]:.2f} | {row["mesh_converged"]} / {row["sweep_converged_and_passive"]} |')
    lines += ['', 'Errors compare simulated absorption with the requested constant level inside its wavelength band. “pp” means percentage points. Mean error is weighted by wavelength. Catalogue error uses the original held-out label spectrum, not the predicted geometry. Small endpoint differences from the rounded dataset grid are interpolated within 0.002 nm. Five diverse cases do not establish performance across the entire test split, and no acceptance tolerance was specified.', '',
             'Requests are objectives, not guarantees of physical feasibility. The catalogue reference also has target error, so the prediction error must be interpreted alongside that reference.', '',
             '![Predicted versus catalogue absorption](absorption_comparison.png)', '']
    if rows:
        maximum = max(row['physical_scores']['polarization_T_max_difference'] for row in rows)
        lines += [f'The largest difference between the two polarization transmission curves is {100*maximum:.2f} percentage points. Although the spectra are averaged as in the received generator, this discrepancy should be checked with a mesh/port convergence study before treating the curves as final physical validation.', '']
    for case in manifest['cases']:
        entry = status[case['case']]
        if entry['stage'] == 'solved':
            lines += [f'![{case["case"]} T/R/A]({case["case"]}_spectrum.png)', '']
        else:
            lines += [f'{case["case"]}: {entry["stage"]}. {entry.get("error", "").strip().splitlines()[-1:]}', '']
    lines += ['Projects, spectra and native diagnostics: `src/validation/ray/ray_01/` through `ray_05/`. Selection and checkpoint hashes: `predictions.json`. Full numerical comparison: `physical_summary.json`. Detailed runtime status: `hfss_status.json`.', '']
    (OUTPUT / 'ray_hfss.md').write_text('\n'.join(lines))
    print(json.dumps([dict(case=row['case'], worst=row['physical_scores']['worst_error'], catalogue=row['catalogue_scores']['worst_error'], mesh=row['mesh_converged'], sweep=row['sweep_converged_and_passive']) for row in rows], indent=2))


if __name__ == "__main__":
    main()
