import numpy as np
import pytest
import torch
from inverse_design.core import Architecture, Model, dataset, normalize, decode
from inverse_design.training import Config, train, load_model, predict


def test_data():
    a = dataset()
    b = dataset()
    for k in a:
        assert np.array_equal(a[k], b[k])
    assert len(a['x']) == 400
    assert (a['coordinates'][a['geometry'] < 2, 1] == 0).all()
    assert np.array_equal(np.bincount(a['geometry'] * 2 + a['substrate']), [50] * 8)
    assert [len(a[k]) for k in ('train', 'validation', 'test')] == [280, 60, 60]
    assert len(set(np.concatenate([a[k] for k in ('train', 'validation', 'test')]))) == 400


def test_domain():
    assert np.array_equal(normalize([[450, 1600, 0]]), [[0, 1, 0]])
    for row in ([450, 450, 0], [449, 1600, 0], [450, 1601, 0], [450, 1600, 2], [450, 1600, float('nan')], [449.999999999, 1600, 0], [450, 1600.000000001, 0]):
        with pytest.raises(ValueError):
            normalize([row])
    assert np.array_equal(decode([[0, 0], [1, 1], [1, 1]], [2, 3, 0]), [[0, 0], [320, 320], [320, 0]])


def test_model_and_roundtrip(tmp_path, capsys):
    model = Model(Architecture(width=64, depth=1))
    out = model(torch.zeros(8, 3))
    assert [tuple(t.shape) for t in out] == [(8, 4), (8, 2), (8, 2)]
    sum(t.square().mean() for t in out).backward()
    assert all(torch.isfinite(p.grad).all() for p in model.parameters())
    cfg = Config(epochs=2, device='cpu')
    result = train(tmp_path, cfg, model.architecture)
    output = capsys.readouterr()
    assert 'Training epoch 1/2' in output.err
    assert 'batch/s' in output.err
    assert 'epoch_duration_seconds' in output.out
    before = predict(load_model(tmp_path, device='cpu'), [[450, 1600, .5]])
    assert train(tmp_path, cfg, model.architecture) == result
    assert before == predict(load_model(tmp_path, device='cpu'), [[450, 1600, .5]])
    with pytest.raises(ValueError, match='incompatible'):
        train(tmp_path, Config(epochs=3, device='cpu'), model.architecture)


def test_baseline_import_does_not_load_search_frameworks():
    import subprocess
    import sys
    subprocess.run([sys.executable, '-c', "import sys; import inverse_design.baseline; assert not {'optuna', 'ray', 'keras', 'autokeras', 'keras_tuner'}.intersection(sys.modules)"], check=True)


def test_runtime_environment_precedes_framework_imports():
    import subprocess
    import sys
    code = """
import os
os.environ.pop('CUDA_VISIBLE_DEVICES', None)
import inverse_design
assert os.environ['CUDA_VISIBLE_DEVICES'] == '0'
assert os.environ['CUDA_DEVICE_ORDER'] == 'PCI_BUS_ID'
assert os.environ['TF_FORCE_GPU_ALLOW_GROWTH'] == 'true'
assert os.environ['CUBLAS_WORKSPACE_CONFIG'] == ':4096:8'
"""
    subprocess.run([sys.executable, '-c', code], check=True)


def test_default_device_requires_gpu_zero(monkeypatch):
    from inverse_design.training import device_for
    monkeypatch.setattr(torch.cuda, 'is_available', lambda: False)
    assert str(device_for(Config())) == 'cuda:0'
    assert str(device_for(Config(device='auto'))) == 'cuda:0'
    assert str(device_for(Config(device='cpu'))) == 'cpu'
    with pytest.raises(ValueError, match='GPU 0'):
        Config(device='cuda:1')


def test_flat_target_labels_preserve_supervised_loss():
    from torch.nn import functional as F
    from inverse_design.training import loss
    outputs = (torch.tensor([[1., -1., .5, 0.]]), torch.tensor([[.2, .8]]), torch.tensor([[.4, .2]]))
    targets = (torch.tensor([2]), torch.tensor([1]), torch.tensor([[.3, .1]]))
    expected = F.cross_entropy(outputs[0], targets[0]) + F.cross_entropy(outputs[1], targets[1]) + F.huber_loss(outputs[2], targets[2])
    assert torch.equal(loss(outputs, targets), expected)
