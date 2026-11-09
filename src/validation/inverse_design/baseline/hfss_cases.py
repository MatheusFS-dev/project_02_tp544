"""Create and solve five baseline predictions in a visible AEDT session."""

import json
import os
import shutil
import time
import traceback

os.environ.setdefault('ANSYSEM_ROOT252', '/usr/local/AnsysEM25R2/v252/AnsysEM')
from ansys.aedt.core import Hfss
from tqdm import tqdm
from baseline_results import OUTPUT, RAW, ROOT, load_builder, plt, save_figure


def persist(status):
    """Atomically save resumable case statuses.

    Args:
        status: Case-keyed JSON-compatible state.
    """
    path = OUTPUT / 'hfss_status.json'
    temporary = path.with_suffix('.tmp')
    temporary.write_text(json.dumps(status, indent=2))
    temporary.replace(path)


def simulate(hfss, builder, case, directory):
    """Run the original optical sweep and export polarization-averaged spectra.

    Args:
        hfss: Active predicted HFSS design.
        builder: Original dataset builder namespace.
        case: Recorded prediction and target request.
        directory: Case output directory.

    Returns:
        Summary of physical absorption error and solver diagnostics.

    Raises:
        RuntimeError: Solver or exported spectrum is invalid.
    """
    import numpy as np
    print(f"Solving {case['case']} with original 401-point sweep", flush=True)
    started = time.perf_counter()
    if not hfss.analyze_setup('Setup1', cores=4):
        raise RuntimeError('HFSS analyze_setup returned false')
    lam, t1, r1 = builder['espectro'](hfss, 'FloquetCima', 'FloquetBaixo', 1, 4, 4)
    _, t2, r2 = builder['espectro'](hfss, 'FloquetCima', 'FloquetBaixo', 2, 4, 4)
    transmittance = (np.array(t1) + t2) / 2
    reflectance = (np.array(r1) + r2) / 2
    rows = np.array(sorted(zip(lam, transmittance, reflectance, 1-transmittance-reflectance)))
    if len(rows) != 401 or not np.isfinite(rows).all():
        raise RuntimeError('Expected 401 finite HFSS spectral samples')
    if (rows[:, 1:] < -1e-3).any() or (rows[:, 1:] > 1.001).any():
        raise RuntimeError('HFSS spectrum violates passive power bounds')
    with (directory / 'spectrum.csv').open('w') as stream:
        stream.write('lambda_nm,T,R,A\n')
        np.savetxt(stream, rows, delimiter=',', fmt='%.9g')
    low, high, target = case['request']
    # Preserve physical target endpoints, interpolating only within the solved range.
    if low < rows[0, 0] - .002 or high > rows[-1, 0] + .002:
        raise RuntimeError('Target band is outside solved wavelength range')
    band_grid = np.r_[low, rows[(rows[:, 0] > low) & (rows[:, 0] < high), 0], high]
    absorption = np.interp(band_grid, rows[:, 0], rows[:, 3])
    errors = np.abs(absorption-target)
    fig, ax = plt.subplots(figsize=(7, 3.5))
    for column, label, color in [(1, 'T', '#53758c'), (2, 'R', '#9b8270'), (3, 'A', '#718c80')]:
        ax.plot(rows[:, 0], rows[:, column], label=label, color=color)
    ax.plot([low, high], [target, target], linestyle='--', color='#444444', label='Requested A')
    ax.axvspan(low, high, color='#777777', alpha=.08)
    ax.set(xlabel='Wavelength (nm)', ylabel='Power fraction', ylim=(-.02, 1.02))
    ax.legend(frameon=False)
    save_figure(fig, f"{case['case']}_spectrum")
    hfss.save_project()
    return dict(worst_error=float(errors.max()), average_error=float(np.trapz(errors, band_grid)/(high-low)),
                ripple=float(np.ptp(absorption)), wavelength_samples=len(rows),
                polarization_T_max_difference=float(np.max(np.abs(np.array(t1)-t2))),
                solve_seconds=time.perf_counter()-started)


def main():
    """Create all predicted projects, then solve each and save a concise report."""
    OUTPUT.mkdir(parents=True, exist_ok=True)
    manifest = json.loads((OUTPUT / 'predictions.json').read_text())
    status_path = OUTPUT / 'hfss_status.json'
    status = json.loads(status_path.read_text()) if status_path.exists() else {}
    builder = load_builder(RAW / 'HFSS_Base_Dados.py')
    desktop_port = int(os.environ['AEDT_GRPC_PORT']) if 'AEDT_GRPC_PORT' in os.environ else None
    projects = []
    for case in tqdm(manifest['cases'], desc='Creating visible AEDT projects', unit='project'):
        key = case['case']
        directory = OUTPUT / key
        directory.mkdir(exist_ok=True)
        project = directory / f'{key}.aedt'
        previous = status.get(key, {})
        if previous.get('stage') == 'solved':
            print(f'{key}: saved result exists, skipping solver', flush=True)
            continue
        try:
            print(f"Creating GUI project {key}: {case['prediction']['family']}", flush=True)
            if not project.exists():
                shutil.copy2(RAW / 'Amostras_simuladas_10_por_familia.aedt', project)
            hfss = Hfss(project=str(project), design=key, solution_type='Modal', version='2025.2',
                        non_graphical=False, new_desktop=desktop_port is None,
                        port=desktop_port or 0, close_on_exit=False)
            desktop_port = hfss.desktop_class.port
            if previous.get('stage') not in ('created', 'solving', 'simulation_failed'):
                for design in list(hfss.design_list):
                    if design != key:
                        hfss.delete_design(design)
                builder['materiais'](hfss)
                prediction = case['prediction']
                if prediction['substrate'] != 'air':
                    raise ValueError('Original template supports air only')
                geometry = {name: '' if value is None else value for name, value in prediction['parameters_nm'].items()}
                geometry.update(id=key, familia=prediction['family'], trilhas=int(prediction['tracks']))
                ar, sub, top, bottom = builder['construir'](hfss, geometry)
                builder['fronteiras_e_portas'](hfss, ar, sub, top, bottom)
                builder['setup_e_varredura'](hfss)
                hfss.modeler.oeditor.FitAll()
                if not hfss.save_project():
                    raise RuntimeError('Failed to save AEDT project')
            status[key] = dict(stage='created', project=str(project.relative_to(ROOT)),
                               family=case['prediction']['family'])
            projects.append((case, directory, hfss))
        except Exception:
            status[key] = dict(stage='creation_failed', error=traceback.format_exc())
            print(status[key]['error'], flush=True)
        persist(status)
    for case, directory, hfss in tqdm(projects, desc='HFSS simulations', unit='case'):
        key = case['case']
        try:
            status[key].update(stage='solving')
            persist(status)
            result = simulate(hfss, builder, case, directory)
            status[key].update(stage='solved', result=result)
        except Exception:
            status[key].update(stage='simulation_failed', error=traceback.format_exc())
            print(status[key]['error'], flush=True)
        persist(status)
    from hfss_report import main as write_report
    write_report()


if __name__ == '__main__':
    main()
