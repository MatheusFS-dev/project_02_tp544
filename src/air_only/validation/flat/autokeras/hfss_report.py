"""Report actual HFSS target matching and surrogate optimism for flat AutoKeras."""
from datetime import datetime
import hashlib
import json
import re
import numpy as np
from autokeras_results import OUTPUT, RAW, ROOT, plt, save_figure
from air_only.shared.flatness import score_band
from air_only.shared import storage


def main():
    """Verify native solver evidence and plot physical versus predicted spectra."""
    print('Verifying original HFSS sources and exported solver spectra', flush=True)
    original = json.loads((RAW/'import_manifest.json').read_text())
    for item in original['files']:
        if item['path'].endswith(('.aedt', '.py')):
            assert hashlib.sha256((RAW/item['path']).read_bytes()).hexdigest() == item['sha256']
    manifest = json.loads((OUTPUT/'predictions.json').read_text())
    status = json.loads((OUTPUT/'hfss_status.json').read_text())
    old = json.loads((ROOT/'validation/reference/inverse_baseline_hfss_status.json').read_text())
    figure, axes = plt.subplots(5, 1, figsize=(7, 10), sharex=True, sharey=True)
    rows = []
    print('Comparing actual absorption with target, surrogate, and received training reference', flush=True)
    for case, ax in zip(manifest['cases'], axes):
        key = case['case']
        entry = status[key]
        if entry['stage'] != 'solved':
            ax.text(.5, .5, f'{key}: {entry["stage"]}', ha='center', transform=ax.transAxes)
            continue
        directory = OUTPUT/key
        spectrum = np.genfromtxt(directory/'spectrum.csv', delimiter=',', names=True)
        predicted = np.genfromtxt(OUTPUT/case['predicted_spectrum'], delimiter=',', names=True)
        reference = np.genfromtxt(RAW/'Espectros_TRA'/f'{case["reference_source_id"]}.csv', delimiter=',', names=True)
        if len(spectrum) != 401 or not np.isfinite(np.array([spectrum[name] for name in spectrum.dtype.names])).all():
            raise ValueError(f'invalid HFSS spectrum: {key}')
        if not np.allclose(spectrum['T']+spectrum['R']+spectrum['A'], 1, atol=2e-8):
            raise ValueError(f'invalid HFSS power conservation: {key}')
        profiles = list((directory/f'{key}.aedtresults'/f'{key}.results').glob('*.profile'))
        profile = '\n'.join(path.read_text(errors='replace') for path in profiles)
        archive = directory/'solver_profile.txt'
        if profile:
            archive.write_text(profile)
        elif archive.exists():
            print(f'{key}: reading archived native solver profile', flush=True)
            profile = archive.read_text()
        delta = re.findall(r'Max Mag\. Delta S.*?, ([0-9.eE+-]+),', profile)
        catalogue = score_band(reference['lambda_nm'], reference['A'], np.array(case['request']))
        discrepancy = np.abs(spectrum['A']-np.interp(spectrum['lambda_nm'], predicted['lambda_nm'], predicted['A']))
        previous = old[case['previous_case']]['result']
        physical = entry['result']
        details = dict(case=key, family=case['prediction']['family'], request=case['request'],
                       prediction=case['prediction'], physical_scores=physical,
                       predicted_worst_error_pp=case['predicted_worst_error_pp'],
                       predicted_average_error_pp=case['predicted_average_error_pp'],
                       surrogate_optimism_pp=physical['worst_error']*100-case['predicted_worst_error_pp'],
                       spectrum_surrogate_mae_pp=float(discrepancy.mean()*100),
                       reference_source_id=case['reference_source_id'], reference_scores=catalogue,
                       previous_inverse_baseline_worst_error_pp=previous['worst_error']*100,
                       change_from_previous_inverse_baseline_pp=(physical['worst_error']-previous['worst_error'])*100,
                       mesh_converged='Adaptive Passes converged' in profile if profile else None,
                       sweep_converged_and_passive='Interpolating sweep converged and is passive' in profile if profile else None,
                       final_adaptive_delta_s=float(delta[-1]) if delta else None,
                       spectrum_sha256=hashlib.sha256((directory/'spectrum.csv').read_bytes()).hexdigest(),
                       solver_profile_sha256=hashlib.sha256(profile.encode()).hexdigest() if profile else None)
        storage.save_json(directory/'diagnostics.json', details)
        rows.append(details)
        low, high, target = case['request']
        ax.plot(spectrum['lambda_nm'], spectrum['A'], color='#718c80', label='Actual HFSS optimized geometry')
        ax.plot(predicted['lambda_nm'], predicted['A'], color='#53758c', linestyle='--', label='Surrogate prediction')
        ax.plot(reference['lambda_nm'], reference['A'], color='#9b8270', linestyle=':', label='Received training reference')
        ax.plot([low, high], [target, target], color='#444444', linestyle='--', label='Requested A')
        ax.axvspan(low, high, color='#777777', alpha=.07)
        ax.set(ylabel='Absorption', ylim=(0, 1.02))
        ax.text(.99, .88, f'{key}: {case["prediction"]["family"]}', transform=ax.transAxes, ha='right', fontsize=9)
    axes[0].legend(frameon=False, loc='upper left', fontsize=7)
    axes[-1].set_xlabel('Wavelength (nm)')
    figure.tight_layout()
    save_figure(figure, 'absorption_comparison')
    storage.save_json(OUTPUT/'physical_summary.json', rows)
    print('Writing concise actual-HFSS results', flush=True)
    lines = ['# Flat AutoKeras HFSS validation', '', f'Date: {datetime.now().astimezone().isoformat(timespec="seconds")}', '',
             f'{len(rows)}/5 optimized geometries have actual 401-point HFSS spectra. Original project and builder hashes were verified. '
             'The same five target requests as the earlier inverse baseline are used for paired comparison. '
             'Each new geometry was optimized with the trained flat-spectrum AutoKeras winner, using only training starts and bounds.', '',
             '| Project | Family | Predicted worst (pp) | HFSS worst (pp) | HFSS mean (pp) | Earlier inverse worst (pp) | Mesh / sweep converged |',
             '|---|---|---:|---:|---:|---:|---|']
    for row in rows:
        key = row['case']
        lines.append(f'| [{key}]({key}/{key}.aedt) | {row["family"]} | {row["predicted_worst_error_pp"]:.2f} | '
                     f'{row["physical_scores"]["worst_error"]*100:.2f} | {row["physical_scores"]["average_error"]*100:.2f} | '
                     f'{row["previous_inverse_baseline_worst_error_pp"]:.2f} | {row["mesh_converged"]} / {row["sweep_converged_and_passive"]} |')
    lines += ['', 'Errors measure deviation from the requested constant absorption inside its band. “pp” means percentage points. '
              'Mean errors are wavelength-weighted. Geometry values are used as optimized, without catalogue snapping. '
              'The original 320 nm cell, 30 nm gold, air, material dispersion, normal incidence, four Floquet modes per port '
              'and original adaptive/interpolating sweep settings are preserved. Spectra average the two incident polarizations.', '',
              '![Actual versus predicted absorption](absorption_comparison.png)', '']
    if rows:
        passing = sum(row['physical_scores']['worst_error'] <= .05 for row in rows)
        improved = sum(row['change_from_previous_inverse_baseline_pp'] < 0 for row in rows)
        maximum = max(row['physical_scores']['polarization_T_max_difference'] for row in rows)*100
        lines += [f'{passing}/{len(rows)} cases meet ±5 pp across the full requested band. '
                  f'{improved}/{len(rows)} have lower worst target error than the earlier inverse baseline on the identical request. '
                  'These are five fixed examples, not a test-set-wide success estimate.', '',
                  f'The largest two-polarization transmission difference is {maximum:.2f} pp. '
                  'Converged solver status does not remove the need for mesh/port convergence studies before final physical acceptance.', '',
                  'High absorption objectives can remain far from the spectra available in the received catalogue. '
                  'Low forward-spectrum test MAE does not guarantee that optimized geometries satisfy the requested target. '
                  'Native solver convergence and surrogate optimism are recorded per case.', '']
    for case in manifest['cases']:
        if status[case['case']]['stage'] == 'solved':
            lines += [f'![{case["case"]} T/R/A]({case["case"]}_spectrum.png)', '']
        else:
            lines += [f'{case["case"]}: {status[case["case"]]["stage"]}.', '']
    lines += ['Full metrics and checkpoint hashes: [autokeras_validation.md](autokeras_validation.md). '
              'Solver status: [hfss_status.json](hfss_status.json). '
              'Physical comparison: [physical_summary.json](physical_summary.json).', '']
    (OUTPUT/'autokeras_hfss.md').write_text('\n'.join(lines))
    print(json.dumps([dict(case=row['case'], worst_pp=row['physical_scores']['worst_error']*100,
                          predicted_pp=row['predicted_worst_error_pp'], mesh=row['mesh_converged'],
                          sweep=row['sweep_converged_and_passive']) for row in rows], indent=2), flush=True)


if __name__ == '__main__':
    main()
