"""Family experts, routing and masked regression tests."""
import numpy as np
import torch
from inverse_design.core import Architecture, Model


def test_experts_have_only_active_parameters_and_receive_routed_gradients():
    from inverse_design.families import ACTIVE, expert_loss
    spec = Architecture(schema=2, width=64, depth=1)
    model = Model(spec)
    assert [head[-2].out_features for head in model.experts] == [len(a) for a in ACTIVE]
    outputs = model(torch.rand(3, 3))
    assert outputs[0].shape == (3, 12)
    assert outputs[2].shape == (3, 12, 7)
    family = torch.tensor([0, 0, 0])
    expert_loss(outputs, [family, torch.zeros(3, dtype=torch.long), torch.zeros(3, 7)]).backward()
    assert model.experts[0][0].weight.grad.abs().sum() > 0
    assert all(head[0].weight.grad is None or head[0].weight.grad.abs().sum() == 0 for head in model.experts[1:])


def test_stratification_preserves_all_families_and_groups():
    from inverse_design.family_data import stratified_split
    labels = np.repeat(np.arange(12), 100)
    splits = stratified_split(labels)
    assert [len(splits[k]) for k in ('train', 'validation', 'test')] == [840, 180, 180]
    assert len(set(np.concatenate(list(splits.values())))) == 1200
    for indices in splits.values():
        assert set(labels[indices]) == set(range(12))


def test_expert_training_checkpoint_and_inference(tmp_path):
    from inverse_design.families import MASK
    from inverse_design.training import Config, train, load_model, predict
    labels = np.tile(np.arange(12), 3)
    n = len(labels)
    path = tmp_path / 'families.npz'
    np.savez(path, x=np.tile([500., 600., .2], (n, 1)), geometry=labels,
             substrate=np.zeros(n, dtype=np.int64), coordinates=np.full((n, 7), .2, dtype=np.float32) * MASK[labels],
             train=np.arange(12), validation=np.arange(12, 24), test=np.arange(24, 36))
    result = train(tmp_path / 'run', Config(data=str(path), device='cpu', epochs=1), Architecture(width=64, depth=1))
    assert result['architecture']['schema'] == 2
    prediction = predict(load_model(tmp_path / 'run', device='cpu'), [[500, 600, .2]])[0]
    assert prediction['family'].startswith('F')
    assert len(prediction['parameters_nm']) == 7


def test_autokeras_experts_export_equivalent_predictions(tmp_path):
    from inverse_design.autokeras_search import run
    from inverse_design.training import Config, load_model
    from inverse_design.families import MASK
    labels = np.tile(np.arange(12), 3)
    path = tmp_path / 'families.npz'
    np.savez(path, x=np.tile([500., 600., .2], (36, 1)), geometry=labels,
             substrate=np.zeros(36, dtype=np.int64), coordinates=np.full((36, 7), .2, dtype=np.float32) * MASK[labels],
             train=np.arange(12), validation=np.arange(12, 24), test=np.arange(24, 36))
    run(Config(data=str(path), output=str(tmp_path / 'search'), device='cpu', epochs=1, candidates=1))
    model = load_model(tmp_path / 'search/autokeras/winner', device='cpu')
    assert model.architecture.schema == 2
    import keras
    original = keras.models.load_model(tmp_path / 'search/autokeras/winner/best.keras')
    x = np.array([[.1, .2, .3]], dtype=np.float32)
    model.eval()
    outputs = model(torch.tensor(x))
    with torch.no_grad():
        expected = original([x], training=False)
    for a, b in zip(outputs, expected):
        np.testing.assert_allclose(a.detach().numpy(), b.detach().cpu().numpy(), atol=2e-6)


def test_expert_loss_ignores_inactive_coordinates():
    from inverse_design.families import expert_loss
    family = torch.tensor([0])
    logits = torch.zeros(1, 12)
    substrates = torch.zeros(1, 2)
    values = torch.zeros(1, 12, 7)
    targets = [family, torch.zeros(1, dtype=torch.long), torch.zeros(1, 7)]
    before = expert_loss((logits, substrates, values), targets)
    values[:, 0, 0] = 100
    assert expert_loss((logits, substrates, values), targets) == before
    values[:, 0, 4] = 1
    assert expert_loss((logits, substrates, values), targets) > before


def test_vectorized_flat_selection_matches_reference():
    from inverse_design.family_data import select_flat
    from inverse_design.flatness import select_design
    grid = np.array([500., 550., 600.])
    spectra = np.array([[.2, .4, .2], [.3, .3, .3], [.3, .3, .3]])
    winner = select_flat(grid, spectra, 0, 2, .35)
    reference, _ = select_design(grid, {str(i): s for i, s in enumerate(spectra)}, [500, 600, .35])
    assert winner == int(reference)
