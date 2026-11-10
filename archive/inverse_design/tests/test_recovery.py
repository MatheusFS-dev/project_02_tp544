"""Regression coverage for epoch recovery and exclusive run ownership."""
from dataclasses import replace
import numpy as np
import pytest
import torch
from inverse_design import storage
from inverse_design.core import Architecture, Model, dataset, normalize
from inverse_design.training import Config, loss, train


class Interrupted(Exception):
    pass


def test_resume_matches_uninterrupted_and_corruption(tmp_path):
    cfg = Config(epochs=5, device='cpu', min_delta=100, patience=3)
    spec = Architecture(width=64, depth=1, dropout=.2)
    reference = train(tmp_path / 'reference', cfg, spec, evaluate_test=False)
    def stop(state):
        if state['epoch'] == 2:
            raise Interrupted
    with pytest.raises(Interrupted):
        train(tmp_path / 'resumed', cfg, spec, report=stop, evaluate_test=False)
    saved = storage.load(tmp_path / 'resumed')
    assert saved['epoch'] == 2 and saved['wait'] == 1
    assert max(float(v['step']) for v in saved['optimizer']['state'].values()) == 18
    (tmp_path / 'resumed' / 'epoch-0002.ckpt').write_bytes(b'corrupt')
    assert storage.load(tmp_path / 'resumed')['epoch'] == 1
    recovered = train(tmp_path / 'resumed', cfg, spec, evaluate_test=False)
    assert recovered == reference
    a, b = storage.load(tmp_path / 'reference'), storage.load(tmp_path / 'resumed')
    assert a['wait'] == b['wait'] == 3
    assert a['epoch'] == b['epoch'] == 4
    for k in a['weights']:
        assert torch.equal(a['weights'][k], b['weights'][k])
    assert len(list((tmp_path / 'resumed').glob('epoch-*.ckpt'))) == 2
    with pytest.raises(ValueError, match='incompatible'):
        train(tmp_path / 'resumed', replace(cfg, seed=43), spec)


def test_lock_released_and_all_invalid_rejected(tmp_path):
    with storage.ownership(tmp_path):
        with pytest.raises(RuntimeError, match='already owned'):
            with storage.ownership(tmp_path):
                pass
    with storage.ownership(tmp_path):
        pass
    (tmp_path / 'epoch-0001.ckpt').write_bytes(b'broken')
    with pytest.raises(ValueError, match='no valid'):
        storage.load(tmp_path)


def test_overfit_small_subset():
    torch.set_num_threads(1)
    torch.manual_seed(42)
    data = dataset()
    indices = np.array([i * 50 for i in range(8)])
    model = Model(Architecture(width=128, depth=2))
    optimizer = torch.optim.AdamW(model.parameters(), lr=1e-3, weight_decay=1e-4)
    x = torch.tensor(normalize(data['x'][indices]))
    targets = [torch.tensor(data[k][indices]) for k in ('geometry', 'substrate', 'coordinates')]
    initial = float(loss(model(x), targets).detach())
    for _ in range(50):
        optimizer.zero_grad()
        objective = loss(model(x), targets)
        objective.backward()
        optimizer.step()
    outputs = model(x)
    assert float(loss(outputs, targets).detach()) < initial * .05
    assert torch.equal(outputs[0].argmax(-1), targets[0])
    assert torch.equal(outputs[1].argmax(-1), targets[1])
