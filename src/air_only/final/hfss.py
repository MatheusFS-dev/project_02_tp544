"""Generate and optionally simulate an air geometry using the received HFSS setup."""
from air_only.final.workflow import configuration, validate_geometry, geometry_text, logging
from pathlib import Path
import ast
import hashlib
import json
import os
import shutil
import socket
import subprocess
import time
import numpy as np
from air_only.shared import storage
from air_only.shared.families import NAMES, PARAMETERS, MASK


def score_actual(wavelengths, absorption, request):
    """Score actual absorption with interpolated physical band endpoints.

    Args:
        wavelengths: Strictly increasing solved grid in nm.
        absorption: Actual absorption fractions on the solved grid.
        request: Band start/end in nm and desired absorption fraction.

    Returns:
        Worst and wavelength-weighted mean absolute error in percentage points.
    """
    grid = np.asarray(wavelengths, dtype=float)
    values = np.asarray(absorption, dtype=float)
    query = np.asarray(request, dtype=float)
    if (query.shape != (3,) or not np.isfinite(query).all() or grid.ndim != 1 or len(grid) < 2
            or values.shape != grid.shape or not np.isfinite(grid).all() or not np.isfinite(values).all()
            or not (np.diff(grid) > 0).all()):
        raise ValueError('Invalid solved spectrum or target request')
    low, high, target = query
    if not grid[0] <= low < high <= grid[-1] or not 0 <= target <= 1:
        raise ValueError('Target must be inside the solved domain with absorption in [0, 1]')
    points = np.r_[low, grid[(grid > low) & (grid < high)], high]
    error = np.abs(np.interp(points, grid, values)-target)
    # Include target crossings for an exact piecewise-linear integral of |A-target|.
    difference = np.interp(points, grid, values)-target
    crossings = []
    for i in range(len(points)-1):
        if difference[i]*difference[i+1] < 0:
            crossings.append(points[i]-difference[i]*(points[i+1]-points[i])/(difference[i+1]-difference[i]))
    integral_grid = np.sort(np.r_[points, crossings])
    integral_error = np.abs(np.interp(integral_grid, grid, values)-target)
    return dict(worst_error_pp=float(error.max()*100),
                mean_error_pp=float(np.trapz(integral_error, integral_grid)/(high-low)*100))


def load_builder(raw):
    """Load received HFSS functions without executing the original batch driver.

    Args:
        raw: Received dataset directory.

    Returns:
        Original geometry, material, boundary and solver function namespace.
    """
    path = Path(raw)/'HFSS_Base_Dados.py'
    source = path.read_text(encoding='utf-8-sig')
    namespace = {}
    exec(compile(source.split('AQUI =', 1)[0], str(path), 'exec'), namespace)
    nodes = [node for node in ast.parse(source).body if isinstance(node, ast.FunctionDef)
             or (isinstance(node, ast.Assign) and
                 {item.id for item in ast.walk(node.targets[0]) if isinstance(item, ast.Name)} == {'C0', 'EPS0'})]
    exec(compile(ast.Module(body=nodes, type_ignores=[]), str(path), 'exec'), namespace)
    namespace['log'] = lambda message: print(message, flush=True)
    return namespace


def desktop(settings, directory):
    """Start a detached graphical AEDT process or attach to an explicit port.

    Args:
        settings: Installation and version settings from the final TOML.
        directory: Output directory for desktop startup logs.

    Returns:
        Graphical AEDT gRPC port.
    """
    if os.environ.get('AEDT_GRPC_PORT'):
        return int(os.environ['AEDT_GRPC_PORT'])
    with socket.socket() as connection:
        connection.bind(('127.0.0.1', 0))
        port = connection.getsockname()[1]
    print(f'Starting visible AEDT desktop on port {port}', flush=True)
    with (directory/'desktop.log').open('a') as stream:
        process = subprocess.Popen([str(Path(settings['installation'])/'ansysedt'), '-grpcsrv', str(port)],
                                   stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
    started = time.monotonic()
    while time.monotonic()-started < 180:
        if process.poll() is not None and process.returncode != 0:
            raise RuntimeError(f'AEDT startup failed, see {directory/"desktop.log"}')
        try:
            with socket.create_connection(('127.0.0.1', port), timeout=1):
                return port
        except OSError:
            print(f'Waiting for graphical AEDT startup: {time.monotonic()-started:.0f}s elapsed', flush=True)
            time.sleep(3)
    raise RuntimeError(f'AEDT startup timed out, see {directory/"desktop.log"}')


def generate(geometry, config, settings, simulate=True):
    """Create a received-template project and optionally solve its original sweep.

    Args:
        geometry: Valid family/air/native-nm geometry, optionally with target request.
        config: Complete final workflow settings.
        settings: AEDT version, installation and CPU core settings.
        simulate: Whether to solve and export the original 401-point spectrum.

    Returns:
        Paths and status of the generated project and optional actual spectrum.
    """
    validate_geometry(geometry)
    raw = Path(config.raw)
    template = raw/'Amostras_simuladas_10_por_familia.aedt'
    builder_path = raw/'HFSS_Base_Dados.py'
    specification = dict(geometry=geometry, settings=settings,
                         template_sha256=hashlib.sha256(template.read_bytes()).hexdigest(),
                         builder_sha256=hashlib.sha256(builder_path.read_bytes()).hexdigest())
    key = 'geometry_'+storage.digest(specification)[:16]
    with storage.ownership(Path(config.output)/'hfss'/key) as directory:
        storage.manifest(directory, specification)
        project = directory/f'{key}.aedt'
        status_path = directory/'status.json'
        state = json.loads(status_path.read_text()) if status_path.exists() else {}
        if state.get('stage') == 'building':
            raise RuntimeError('Previous project creation was interrupted. Preserve or remove this generated '
                               f'directory before recreating it: {directory}')
        if state.get('stage') == 'solved' and (directory/'spectrum.csv').exists():
            print(f'Existing solved geometry: {project}', flush=True)
            return state
        os.environ['ANSYSEM_ROOT252'] = settings['installation']
        from ansys.aedt.core import Hfss
        builder = load_builder(raw)
        if not project.exists():
            print('Copying received project without changing the original', flush=True)
            shutil.copy2(template, project)
        port = desktop(settings, directory)
        print(f'Opening GUI project {project}', flush=True)
        hfss = Hfss(project=str(project), design=key, solution_type='Modal', version=settings['version'],
                    non_graphical=False, new_desktop=False, port=port, close_on_exit=False,
                    remove_lock=True)
        try:
            if state.get('stage') not in ('created', 'solving'):
                storage.save_json(status_path, dict(stage='building', project=str(project)))
                for design in list(hfss.design_list):
                    if design != key:
                        hfss.delete_design(design)
                print('Building original gold dispersion and geometry', flush=True)
                builder['materiais'](hfss)
                values = {name: '' if value is None else value for name, value in geometry['parameters_nm'].items()}
                values.update(id=key, familia=geometry['family'], trilhas=int(geometry['tracks']))
                ar, sub, top, bottom = builder['construir'](hfss, values)
                print('Applying original periodic boundaries, Floquet ports and 401-point sweep', flush=True)
                builder['fronteiras_e_portas'](hfss, ar, sub, top, bottom)
                builder['setup_e_varredura'](hfss)
                hfss.modeler.oeditor.FitAll()
                if not hfss.save_project():
                    raise RuntimeError('AEDT project save failed')
                state = dict(stage='created', project=str(project))
                storage.save_json(status_path, state)
                storage.save_json(directory/'geometry.json', geometry)
                (directory/'geometry.txt').write_text(geometry_text(geometry)+'\n')
            if simulate:
                state['stage'] = 'solving'
                storage.save_json(status_path, state)
                print('Solving original 401-point HFSS sweep. This takes several minutes.', flush=True)
                started = time.monotonic()
                if not hfss.analyze_setup('Setup1', cores=settings['cores']):
                    raise RuntimeError('HFSS analyze_setup returned false')
                print('Exporting both incident polarizations and checking power conservation', flush=True)
                lam, t1, r1 = builder['espectro'](hfss, 'FloquetCima', 'FloquetBaixo', 1, 4, 4)
                lam2, t2, r2 = builder['espectro'](hfss, 'FloquetCima', 'FloquetBaixo', 2, 4, 4)
                if not np.allclose(lam, lam2):
                    raise ValueError('HFSS polarization wavelength grids disagree')
                transmission = (np.array(t1)+t2)/2
                reflection = (np.array(r1)+r2)/2
                rows = np.array(sorted(zip(lam, transmission, reflection, 1-transmission-reflection)))
                if (len(rows) != 401 or not np.isfinite(rows).all() or not (np.diff(rows[:, 0]) > 0).all()
                        or (rows[:, 1:] < -.001).any() or (rows[:, 1:] > 1.001).any()):
                    raise ValueError('Invalid actual HFSS spectrum')
                np.savetxt(directory/'spectrum.csv', rows, delimiter=',', header='lambda_nm,T,R,A', comments='')
                profiles = list((directory/f'{key}.aedtresults').rglob('*.profile'))
                profile = '\n'.join(path.read_text(errors='replace') for path in profiles)
                (directory/'solver_profile.txt').write_text(profile)
                state.update(stage='solved', spectrum=str(directory/'spectrum.csv'), samples=len(rows),
                             solve_seconds=time.monotonic()-started,
                             mesh_converged='Adaptive Passes converged' in profile,
                             sweep_converged_and_passive='Interpolating sweep converged and is passive' in profile)
                if 'request' in geometry:
                    state['actual_target_scores'] = score_actual(rows[:, 0], rows[:, 3], geometry['request'])
                hfss.save_project()
                storage.save_json(status_path, state)
            print(f'Project ready: {project}', flush=True)
            print(json.dumps(state, indent=2), flush=True)
            return state
        finally:
            print('Leaving the geometry project open in the graphical desktop', flush=True)
            hfss.desktop_class.release_desktop(close_projects=False, close_on_exit=False)


def main():
    """Read an inference geometry file or prompt for native dimensions in nm."""
    config, _, settings = configuration()
    with logging(config, 'hfss'):
        print('Paste geometry.json from final inference, or press Enter to enter dimensions manually.', flush=True)
        path = input('Geometry JSON path (blank for manual entry): ').strip().strip('\"\'')
        if path:
            geometry = json.loads(Path(path).expanduser().read_text())
        else:
            print('Families: '+', '.join(NAMES)+'. Substrate: air. Circular dimensions are radii.', flush=True)
            family = input('Geometry family (F01–F12): ').strip().upper()
            if family not in NAMES:
                raise ValueError('Choose a listed family')
            index = NAMES.index(family)
            values = {name: float(input(f'{name} (nm): ')) if MASK[index, i] else None
                      for i, name in enumerate(PARAMETERS)}
            geometry = dict(family=family, substrate='air', tracks=index in (5, 7, 9, 11), parameters_nm=values)
        print(geometry_text(geometry), flush=True)
        print('Options: simulate also solves the full optical sweep. Generate creates the GUI project only.', flush=True)
        action = input('Action [simulate/generate, default simulate]: ').strip().lower() or 'simulate'
        if action not in ('simulate', 'generate'):
            raise ValueError('Choose simulate or generate')
        generate(geometry, config, settings, simulate=action == 'simulate')


if __name__ == '__main__':
    main()
