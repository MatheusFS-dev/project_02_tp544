"""Optional real AutoModel export and optimizer recovery tests."""
import importlib.util
import numpy as np
import pytest
import torch

pytestmark = pytest.mark.skipif(importlib.util.find_spec('autokeras') is None, reason='AutoKeras extra not installed')


@pytest.mark.parametrize('trunk', ['dense', 'residual'])
def test_keras_export_equivalence(tmp_path, trunk):
    from inverse_design.autokeras_adapter import make_automodel, torch_weights
    from inverse_design.core import Architecture, Model
    from inverse_design.training import Config
    import keras
    import keras_tuner as kt
    with keras.device('cpu'):
        auto = make_automodel(tmp_path, Config(epochs=1, candidates=1, device='cpu'))
        hp = kt.HyperParameters()
        for key, value in dict(depth=2, width=64, activation='gelu', dropout=.2, trunk=trunk).items():
            hp.Fixed(f'trunk/{key}', value)
        source = auto.tuner.hypermodel.build(hp)
        spec = Architecture(depth=2, width=64, activation='gelu', dropout=.2, trunk=trunk)
        target = Model(spec).eval()
        target.load_state_dict(torch_weights(source, spec))
        x = np.array([[0, 1, 0], [.2, .7, .9]], np.float32)
        with torch.no_grad():
            expected = [v.numpy() for v in target(torch.tensor(x))]
            actual = [v.numpy() for v in source([x], training=False)]
        for a, b in zip(expected, actual):
            np.testing.assert_allclose(a, b, atol=2e-6)


def test_autokeras_epoch_recovery(tmp_path, monkeypatch):
    from inverse_design import storage
    from inverse_design.autokeras_adapter import make_automodel
    from inverse_design.training import Config
    import keras
    import keras_tuner as kt
    from types import SimpleNamespace
    config = Config(epochs=5, candidates=1, device='cpu', min_delta=100, patience=3)
    def run(root):
        with keras.device('cpu'):
            auto = make_automodel(root, config)
            hp = kt.HyperParameters()
            for key, value in dict(depth=1, width=64, activation='silu', dropout=.2, trunk='residual').items():
                hp.Fixed(f'trunk/{key}', value)
            return auto.tuner.run_trial(SimpleNamespace(trial_id='0', hyperparameters=hp))
    expected = run(tmp_path / 'reference')
    original_save = storage.save
    class Interrupted(Exception):
        pass
    def interrupted(directory, state):
        original_save(directory, state)
        if state['epoch'] == 2:
            raise Interrupted
    with monkeypatch.context() as patch:
        patch.setattr(storage, 'save', interrupted)
        with pytest.raises(Interrupted):
            run(tmp_path / 'resumed')
    prior = storage.load(tmp_path / 'resumed/trial-0')
    assert prior['wait'] == 1
    assert int(prior['optimizer'][0]) == 18
    assert run(tmp_path / 'resumed') == expected
    a = storage.load(tmp_path / 'reference/trial-0')
    b = storage.load(tmp_path / 'resumed/trial-0')
    assert a['history'] == b['history']
    assert a['epoch'] == b['epoch'] == 4
    assert a['wait'] == b['wait'] == 3
    for va, vb in zip(a['variables'], b['variables']):
        np.testing.assert_array_equal(va, vb)
    for va, vb in zip(a['optimizer'], b['optimizer']):
        np.testing.assert_array_equal(va, vb)
