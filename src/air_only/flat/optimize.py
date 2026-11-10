"""Constrained geometry search for a constant absorption target over a band."""
from air_only.flat.common import load_config, load_data, logging, device, final_directory
import hashlib
from pathlib import Path
import numpy as np
import torch
from tqdm import tqdm
from air_only.shared import storage
from air_only.shared.families import MASK, SCALES, PARAMETERS, NAMES
from air_only.flat.training import load_model, subset


def band_values(absorption, grid, low, high):
    """Select every in-band sample and interpolate the exact band endpoints.

    Args:
        absorption: Tensor ending in wavelength samples.
        grid: Strictly increasing wavelength grid in nanometers.
        low: Requested lower wavelength in nanometers.
        high: Requested upper wavelength in nanometers.

    Returns:
        Band wavelengths and differentiable absorption values.

    Raises:
        ValueError: The band is empty or outside the received spectral domain.
    """
    grid = np.asarray(grid)
    if not np.isfinite([low, high]).all() or not grid[0] <= low < high <= grid[-1]:
        raise ValueError(f'band must satisfy {grid[0]} <= start < end <= {grid[-1]} nm')
    if absorption.shape[-1] != len(grid) or not np.all(np.diff(grid) > 0):
        raise ValueError('spectrum and wavelength grid are incompatible')
    interior = np.flatnonzero((grid > low) & (grid < high))
    values = []
    for point in (low, high):
        right = int(np.clip(np.searchsorted(grid, point, side='right'), 1, len(grid)-1))
        fraction = (point-grid[right-1])/(grid[right]-grid[right-1])
        values.append(absorption[..., right-1]*(1-fraction)+absorption[..., right]*fraction)
    points = np.r_[low, grid[interior], high]
    return points, torch.cat((values[0][..., None], absorption[..., interior], values[1][..., None]), -1)


def objective(absorption, wavelengths, target):
    """Measure worst deviation and wavelength-weighted mean deviation from target.

    Args:
        absorption: Band absorption tensor ending in spectral samples.
        wavelengths: Corresponding band wavelengths in nanometers.
        target: Constant desired absorption fraction between zero and one.

    Returns:
        Per-candidate worst and mean absolute absorption errors as fractions.
    """
    if not np.isfinite(target) or not 0 <= target <= 1:
        raise ValueError('target absorption must be a fraction in [0, 1]')
    error = (absorption-target).abs()
    grid = torch.as_tensor(wavelengths, dtype=error.dtype, device=error.device)
    return error.amax(-1), torch.trapezoid(error, grid, dim=-1)/(grid[-1]-grid[0])


def project(values, families, low, high):
    """Enforce training bounds, family masks and positive square/circular holes.

    Args:
        values: Normalized candidate parameters.
        families: Integer candidate family tensor.
        low: Lower local trust-region bounds.
        high: Upper local trust-region bounds.

    Returns:
        Feasible normalized geometry parameters with inactive values set to zero.
    """
    result = values.maximum(low).minimum(high).clone()
    mask = torch.as_tensor(MASK, device=values.device)[families]
    square = mask[:, 0].bool()
    circle = mask[:, 2].bool()
    required_square = (2*low[:, 1]*160+1)/320
    required_circle = (low[:, 3]*160+.5)/160
    if ((required_square > high[:, 0]) & square).any() or ((required_circle > high[:, 2]) & circle).any():
        raise ValueError('local bounds contain no positive ring hole')
    result[:, 0] = torch.where(square, result[:, 0].maximum(required_square), result[:, 0])
    result[:, 2] = torch.where(circle, result[:, 2].maximum(required_circle), result[:, 2])
    result[:, 1] = torch.where(square, result[:, 1].minimum((result[:, 0]*320-1)/320), result[:, 1])
    result[:, 3] = torch.where(circle, result[:, 3].minimum(result[:, 2]-.5/160), result[:, 3])
    return result*mask


def optimize(model, data, config, request, output):
    """Search all families near training geometries for flat target absorption.

    Args:
        model: Trained, inference-mode forward surrogate.
        data: Complete prepared data arrays.
        config: Multistart, trust-region and optimization settings.
        request: Band start, band end and desired absorption fraction.
        output: Case directory for candidates and predicted spectra.

    Returns:
        Family-ranked geometry candidates, explicitly not HFSS-verified results.
    """
    low_nm, high_nm, target = map(float, request)
    gpu = next(model.parameters()).device
    grid = data['wavelengths']
    band_values(torch.zeros(1, len(grid)), grid, low_nm, high_nm)
    objective(torch.zeros(1, 2), np.array([low_nm, high_nm]), target)
    rows = subset(data['train'], data['family'], config.max_train)
    print('Selecting training-only multistarts and empirical parameter bounds for all twelve families', flush=True)
    starts, family_values, lowers, uppers, source_ids = [], [], [], [], []
    references = []
    for family in range(12):
        candidates = rows[data['family'][rows] == family]
        parameters = data['parameters'][candidates]
        _, absorption = band_values(torch.as_tensor(data['tra'][candidates, :, 2]), grid, low_nm, high_nm)
        worst, mean = objective(absorption, np.r_[low_nm, grid[(grid > low_nm) & (grid < high_nm)], high_nm], target)
        order = np.lexsort((mean.numpy(), worst.numpy()))[:config.multistarts]
        first = int(order[0])
        references.append(dict(family=NAMES[family], source_id=str(data['source_ids'][candidates[first]]),
                               worst_error_pp=float(worst[first])*100, average_error_pp=float(mean[first])*100))
        lower, upper = parameters.min(0), parameters.max(0)
        radius = (upper-lower)*config.trust_fraction
        for position in order:
            seed = parameters[position]
            starts.append(seed)
            family_values.append(family)
            lowers.append(np.maximum(lower, seed-radius))
            uppers.append(np.minimum(upper, seed+radius))
            source_ids.append(str(data['source_ids'][candidates[position]]))
    families = torch.tensor(family_values, device=gpu)
    lower = torch.as_tensor(np.array(lowers), device=gpu)
    upper = torch.as_tensor(np.array(uppers), device=gpu)
    parameters = torch.nn.Parameter(torch.as_tensor(np.array(starts), device=gpu))
    optimizer = torch.optim.Adam([parameters], lr=.005)
    model.eval()
    for weight in model.parameters():
        weight.requires_grad_(False)
    best = {}
    progress = tqdm(range(config.optimization_steps+1), desc='Minimax flat absorption', unit='step')
    for step in progress:
        optimizer.zero_grad(set_to_none=True)
        spectra = model(families, parameters)
        points, absorption = band_values(spectra[..., 2], grid, low_nm, high_nm)
        worst, mean = objective(absorption, points, target)
        with torch.no_grad():
            for index, family in enumerate(family_values):
                key = (float(worst[index]), float(mean[index]))
                if family not in best or key < best[family]['score']:
                    values = (parameters[index].detach().cpu().numpy()*SCALES).tolist()
                    best[family] = dict(family=NAMES[family], score=key, parameters_nm={
                        name: values[j] if MASK[family, j] else None for j, name in enumerate(PARAMETERS)},
                        trust_lower_nm=(lower[index].cpu().numpy()*SCALES).tolist(),
                        trust_upper_nm=(upper[index].cpu().numpy()*SCALES).tolist(),
                        tracks=family in (5, 7, 9, 11), substrate='air', seed_source_id=source_ids[index],
                        step=step, normalized_parameters=parameters[index].detach().cpu().tolist(),
                        spectrum=spectra[index].detach().cpu().numpy().tolist())
        if step == 0:
            initial_errors = {family: row['score'][0]*100 for family, row in best.items()}
        if step == config.optimization_steps:
            break
        (worst.mean()+.001*mean.mean()).backward()
        optimizer.step()
        with torch.no_grad():
            parameters.copy_(project(parameters, families, lower, upper))
        if step % 25 == 0:
            progress.set_postfix(best_worst_pp=f'{min(value["score"][0] for value in best.values())*100:.3f}')
            print(f'Optimization step {step}/{config.optimization_steps}, best predicted worst error '
                  f'{min(value["score"][0] for value in best.values())*100:.3f} pp', flush=True)
    ranked = sorted(best.values(), key=lambda row: row['score'])
    output = Path(output)
    output.mkdir(parents=True, exist_ok=True)
    for candidate in ranked:
        candidate['initial_best_predicted_worst_error_pp'] = initial_errors[NAMES.index(candidate['family'])]
        candidate['predicted_worst_error_pp'] = candidate['score'][0]*100
        candidate['predicted_average_error_pp'] = candidate['score'][1]*100
        candidate['predicted_within_tolerance'] = candidate['score'][0] <= config.tolerance
        spectrum = np.array(candidate.pop('spectrum'))
        np.savetxt(output/f'{candidate["family"]}_predicted.csv', np.column_stack((grid, spectrum)), delimiter=',',
                   header='lambda_nm,T,R,A', comments='')
        del candidate['score']
    result = dict(request=list(request), tolerance_pp=config.tolerance*100,
                  status='SURROGATE_PREDICTIONS_ONLY_NOT_HFSS_VERIFIED',
                  best_received_training_reference=min(references, key=lambda row: (row['worst_error_pp'], row['average_error_pp'])),
                  constraint='training-only per-family bounds and local multistart trust regions',
                  trust_fraction=config.trust_fraction, ranking='worst absolute target error, then mean absolute error',
                  candidates=ranked)
    storage.save_json(output/'candidates.json', result)
    print(f'Best family {ranked[0]["family"]}: predicted worst error {ranked[0]["predicted_worst_error_pp"]:.3f} pp. '
          'HFSS verification is required.', flush=True)
    return result


def run_case(method):
    """Optimize a request using only the explicitly named case's final model.

    Args:
        method: Case fixed by its dedicated optimization entry point.
    """
    config = load_config(method)
    with logging(config, 'optimize', case=method):
        device(config)
        data, metadata = load_data(config.data)
        grid = data['wavelengths']
        print(f'Available wavelength domain: {grid[0]:.3f}–{grid[-1]:.3f} nm. Absorption uses percent.', flush=True)
        request = [float(input('Band start (nm): ')), float(input('Band end (nm): ')),
                   float(input('Desired constant absorption (%): '))/100]
        model_directory = final_directory(config, method)
        import json
        metrics = json.loads((model_directory/'metrics.json').read_text())
        if metrics['dataset_sha256'] != metadata['dataset_sha256']:
            raise ValueError('selected model was trained with a different dataset')
        digest = hashlib.sha256((model_directory/'best.ckpt').read_bytes()).hexdigest()
        key = storage.digest(dict(request=request, method=method, checkpoint=digest,
                                  steps=config.optimization_steps, starts=config.multistarts,
                                  trust_fraction=config.trust_fraction))[:16]
        result = optimize(load_model(model_directory, config.device), data, config, request,
                          Path(config.output)/method/'designs'/key)
        result.update(checkpoint_sha256=digest, dataset_sha256=metadata['dataset_sha256'])
        storage.save_json(Path(config.output)/method/'designs'/key/'candidates.json', result)
