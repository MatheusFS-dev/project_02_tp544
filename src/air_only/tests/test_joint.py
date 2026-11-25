"""Joint air + silica substrate regression checks."""
from pathlib import Path
import numpy as np
import pytest
import torch
from air_only.flat.model import SpectrumModel
from air_only.flat.training import evaluate, load_model

ROOT = Path(__file__).resolve().parents[1]


def test_single_substrate_model_keeps_air_architecture():
    model = SpectrumModel(401, 256, 3, .1, 'residual')
    assert 'substrates' not in model.architecture
    assert model.input[0].in_features == 30


def test_two_substrate_model_requires_and_uses_substrate():
    model = SpectrumModel(401, 128, 3, 0., 'plain', substrates=2)
    assert model.architecture['substrates'] == 2 and model.input[0].in_features == 32
    families, parameters = torch.tensor([0, 4]), torch.rand(2, 7)
    with pytest.raises(ValueError):
        model(families, parameters)
    output = model(families, parameters, torch.tensor([0, 1]))
    assert output.shape == (2, 401, 3)
    assert torch.allclose(output.sum(-1), torch.ones(2, 401))


def test_existing_air_checkpoint_loads_unchanged():
    model = load_model(ROOT/'runs/final/baseline/final', 'cpu')
    assert model.architecture == dict(points=401, width=256, depth=3, dropout=.1, trunk='residual')


def test_evaluate_reports_each_substrate():
    model = SpectrumModel(5, 16, 1, 0., 'plain', substrates=2)
    data = dict(family=np.array([0, 1, 0, 1]), parameters=np.random.rand(4, 7).astype(np.float32),
                tra=np.full((4, 5, 3), 1/3, dtype=np.float32), substrate=np.array([0, 0, 1, 1]))
    metrics = evaluate(model, data, np.arange(4), 4, 'test')
    assert set(metrics['by_substrate']) == {'air', 'silica'}
    assert metrics['by_substrate']['air']['count'] == 2


DELIVERY = Path.home()/'Downloads/Dataset_CasoB'
TREINAR = ROOT/'data/raw/treinar'


def test_air_loader_defaults_unchanged():
    from air_only.shared.catalogue import load_received
    catalogue = load_received(TREINAR)
    assert len(catalogue['designs']) == 1926 and catalogue['conflicts'] == [] and catalogue['missing_ids'] == []


def test_import_is_idempotent_and_refuses_changes(tmp_path):
    import shutil
    from air_only.joint.import_silica import import_silica
    source = tmp_path/'delivery'
    (source/'Espectros_TRA_B').mkdir(parents=True)
    for name in ('G0001', 'G0022', 'G0075'):
        shutil.copy2(DELIVERY/'Espectros_TRA_B'/f'{name}.csv', source/'Espectros_TRA_B')
    for path in DELIVERY.iterdir():
        if path.is_file():
            shutil.copy2(path, source)
    manifest = import_silica(source, tmp_path/'silica', TREINAR)
    assert 'geometrias_sorteadas.csv' in manifest['identical_to_treinar']
    import_silica(source, tmp_path/'silica', TREINAR)
    (tmp_path/'silica/resultados_B.csv').write_text('changed')
    with pytest.raises(ValueError):
        import_silica(source, tmp_path/'silica', TREINAR)


def test_imported_silica_catalogue():
    from air_only.shared.catalogue import load_received
    arguments = (ROOT/'data/raw/silica', 'Espectros_TRA_B', TREINAR/'geometrias_sorteadas.csv', True)
    catalogue = load_received(*arguments, 1e-3)
    assert len(catalogue['designs']) == 1839 and len(catalogue['missing_ids']) == 90
    assert sorted(c['ids'][0] for c in catalogue['conflicts']) == ['G0006', 'G0022', 'G0041']
    with pytest.raises(ValueError):
        load_received(*arguments, 1e-4)


def test_pair_partitions_inherits_air_split_and_rejects_unknown():
    from air_only.joint.workflow import pair_partitions
    air_keys = [(0, 1.), (0, 2.), (1, 3.)]
    parts = dict(train=np.array([0, 2]), validation=np.array([1]), test=np.array([], dtype=np.int64))
    result = pair_partitions(air_keys, parts, [(1, 3.), (0, 2.)])
    assert result['train'].tolist() == [0] and result['validation'].tolist() == [1] and len(result['test']) == 0
    with pytest.raises(ValueError):
        pair_partitions(air_keys, parts, [(5, 9.)])


def test_prepared_joint_dataset():
    from air_only.flat.common import load_data
    from air_only.joint.workflow import configuration, joint_data
    config, _, _ = configuration()
    data, metadata = joint_data(config)
    assert len(data['family']) == 3765 and (data['substrate'] == 1).sum() == 1839
    assert metadata['substrates'] == ['air', 'silica']
    air, _ = load_data(ROOT/'data/processed/final_flat/dataset.npz')
    for key in ('family', 'parameters', 'tra', 'source_ids', 'wavelengths'):
        assert np.array_equal(data[key][:1926], air[key]) or key == 'wavelengths' and np.array_equal(data[key], air[key])
    assert np.array_equal(data['validation'][data['validation'] < 1926], air['validation'])
    assert len(data['test']) == 0
    partition = np.empty(len(data['family']), dtype=object)
    partition[data['train']], partition[data['validation']] = 'train', 'validation'
    keys = {}
    for row in range(len(data['family'])):
        key = (int(data['family'][row]), *data['parameters'][row].tolist())
        keys.setdefault(key, set()).add(partition[row])
    assert all(len(value) == 1 for value in keys.values())


def _joint_setup():
    from dataclasses import replace
    from air_only.joint.workflow import configuration, joint_data
    config, _, _ = configuration()
    data, _ = joint_data(config)
    return data, replace(config, optimization_steps=2, multistarts=1)


def test_joint_validator_accepts_silica_and_final_still_rejects():
    from air_only.final import workflow as final_workflow
    from air_only.joint import workflow as joint_workflow
    geometry = dict(family='F03', substrate='silica', tracks=False,
                    parameters_nm=dict(Lout_q=None, w_q=None, Rout_c=80., w_c=30., R_d=None, L_s=None, w_t=None))
    joint_workflow.validate_geometry(geometry)
    with pytest.raises(ValueError, match='substrate'):
        final_workflow.validate_geometry(geometry)


def test_optimize_searches_both_substrates(tmp_path):
    from air_only.flat.optimize import optimize
    data, settings = _joint_setup()
    model = SpectrumModel(401, 128, 3, 0., 'plain', substrates=2)
    result = optimize(model, data, settings, [600., 700., .3], tmp_path)
    assert len(result['candidates']) == 24
    assert {c['substrate'] for c in result['candidates']} == {'air', 'silica'}
    assert (tmp_path/'F01_silica_predicted.csv').exists()


def test_optimize_rejects_air_model_on_joint_data(tmp_path):
    from air_only.flat.optimize import optimize
    data, settings = _joint_setup()
    with pytest.raises(ValueError):
        optimize(SpectrumModel(401, 128, 3, 0., 'plain'), data, settings, [600., 700., .3], tmp_path)


def test_import_rerun_from_moved_delivery_verifies(tmp_path):
    import shutil
    from air_only.joint.import_silica import import_silica
    source = tmp_path/'delivery'
    (source/'Espectros_TRA_B').mkdir(parents=True)
    shutil.copy2(DELIVERY/'Espectros_TRA_B/G0001.csv', source/'Espectros_TRA_B')
    for path in DELIVERY.iterdir():
        if path.is_file():
            shutil.copy2(path, source)
    import_silica(source, tmp_path/'silica', TREINAR)
    moved = shutil.move(source, tmp_path/'moved')
    import_silica(moved, tmp_path/'silica', TREINAR)
    (tmp_path/'silica/audit.json').write_text('{}')
    with pytest.raises(ValueError):
        import_silica(moved, tmp_path/'silica', TREINAR)


def test_joint_comparison_dataset_keeps_air_70_15_15_split():
    from air_only.flat.common import load_data
    from air_only.joint.workflow import configuration, joint_data
    config, _, extras = configuration('joint_comparison')
    assert extras['split'] == 'comparison'
    data, _ = joint_data(config)
    air, _ = load_data(ROOT/'data/processed/flat_spectra/dataset.npz')
    for key in ('train', 'validation', 'test'):
        assert np.array_equal(data[key][data[key] < 1926], air[key])
        assert (data['substrate'][data[key]] == 1).any()
    partition = {}
    for key in ('train', 'validation', 'test'):
        for row in data[key]:
            identity = (int(data['family'][row]), *data['parameters'][row].tolist())
            partition.setdefault(identity, set()).add(key)
    assert all(len(value) == 1 for value in partition.values())
