"""Regression checks for spectrum-based flat-absorption design."""
import numpy as np
import pytest
import torch


@pytest.mark.parametrize('trunk', ['plain', 'residual'])
def test_spectrum_conserves_power_and_ignores_inactive_parameters(trunk):
    from flat.model import SpectrumModel
    model = SpectrumModel(points=9, width=16, depth=2, dropout=0, trunk=trunk).eval()
    families = torch.tensor([0, 1])
    parameters = torch.zeros(2, 7)
    changed = parameters.clone()
    changed[0, 0] = 1
    with torch.no_grad():
        result = model(families, parameters)
        alternate = model(families, changed)
    assert result.shape == (2, 9, 3)
    assert torch.all(result >= 0)
    assert torch.allclose(result.sum(-1), torch.ones(2, 9), atol=1e-6)
    assert torch.equal(result[0], alternate[0])


def test_band_objective_includes_interpolated_endpoints_and_target_level():
    from flat.optimize import band_values, objective
    grid = np.array([450., 600., 900.])
    absorption = torch.tensor([[0., .6, .3]], requires_grad=True)
    points, band = band_values(absorption, grid, 525., 750.)
    assert np.allclose(points, [525, 600, 750])
    assert torch.allclose(band, torch.tensor([[.3, .6, .45]]))
    worst, average = objective(band, points, .5)
    assert worst.item() == pytest.approx(.2)
    assert average.item() > 0
    worst.sum().backward()
    assert torch.isfinite(absorption.grad).all()
    flat = torch.full((1, 3), .2)
    assert objective(flat, grid, .8)[0].item() == pytest.approx(.6)


def test_invalid_requested_band_is_rejected():
    from flat.optimize import band_values
    with pytest.raises(ValueError):
        band_values(torch.zeros(1, 3), np.array([450., 600., 900.]), 400., 700.)


def test_nested_bands_cannot_reduce_worst_error():
    from flat.optimize import band_values, objective
    grid = np.array([450., 500., 600., 750., 900.])
    spectrum = torch.tensor([[.1, .5, .6, .2, .4]])
    scores = []
    for width in (50., 100., 200., 400.):
        points, values = band_values(spectrum, grid, 650-width/2, 650+width/2)
        scores.append(objective(values, points, .5)[0].item())
    assert np.all(np.diff(scores) >= 0)


def test_smoke_subset_keeps_every_family_and_never_changes_full_training():
    from flat.training import subset
    families = np.repeat(np.arange(12), 20)
    indices = np.arange(len(families))
    selected = subset(indices, families, 36)
    assert np.array_equal(np.bincount(families[selected]), np.full(12, 3))
    assert np.array_equal(subset(indices, families, 0), indices)


def test_projection_preserves_positive_ring_holes_and_inactive_dimensions():
    from flat.optimize import project
    values = torch.tensor([[.2, .9, .2, .9, .5, .5, .5]])
    low = torch.zeros(1, 7)
    high = torch.ones(1, 7)
    result = project(values, torch.tensor([4]), low, high)
    assert result[0, 1]*160 < result[0, 0]*320/2
    assert result[0, 3]*160 < result[0, 2]*160
    assert torch.equal(result[0, 4:], torch.zeros(3))


@pytest.mark.parametrize('case', ['baseline', 'optuna', 'autokeras', 'ray'])
def test_each_case_has_its_own_runner_and_final_model_path(case):
    import importlib
    from pathlib import Path
    from flat.common import Config, final_directory
    settings = Config(data='received.npz', raw='raw', output='/independent')
    assert final_directory(settings, case) == Path('/independent')/case/'final'
    training = importlib.import_module(f'flat.cases.{case}.train')
    optimization = importlib.import_module(f'flat.cases.{case}.optimize')
    assert callable(training.main)
    assert callable(optimization.main)


def test_autokeras_export_preserves_the_forward_spectrum():
    from flat.cases.autokeras.model import make_automodel, architecture, torch_weights, pack_inputs
    from flat.common import Config
    from flat.model import SpectrumModel
    import tempfile
    with tempfile.TemporaryDirectory() as directory:
        config = Config(data='unused', raw='unused', output=directory, candidates=1)
        auto = make_automodel(directory, config, points=9)
        hp = auto.tuner.oracle.get_space()
        keras_model = auto.tuner.hypermodel.build(hp)
        spec = architecture(hp, 9)
        families = np.array([0, 4, 11])
        parameters = np.full((3, 7), .2, dtype=np.float32)
        inputs = pack_inputs(families, parameters)
        reference = keras_model.predict_on_batch([inputs])
        if isinstance(reference, list):
            reference = reference[0]
        model = SpectrumModel(**spec).eval()
        model.load_state_dict(torch_weights(keras_model, spec))
        with torch.no_grad():
            output = model(torch.tensor(families), torch.tensor(parameters)).numpy()
        assert np.allclose(output, reference, atol=2e-6)


def test_ray_mutable_training_state_is_outside_experiment_sync_tree():
    from flat.common import Config
    from flat.cases.ray.train import candidate_directory
    from pathlib import Path
    config = Config(data='received.npz',raw='raw',output='/case-output')
    directory = candidate_directory(config,'trial_00001')
    assert directory == Path('/case-output/ray/training/trial_00001')
    assert not directory.is_relative_to(Path('/case-output/ray/experiment'))
