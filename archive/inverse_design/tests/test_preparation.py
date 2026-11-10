"""Received CSV conversion and reproducible flat-target labels."""
import csv
import json
from pathlib import Path
import numpy as np
import pytest
from inverse_design.core import dataset
from inverse_design.preparation import load_catalogue, prepare_dataset, validate_preparation


def write_csv(path, fields, rows):
    """Write a small received-data fixture."""
    with path.open('w', newline='') as stream:
        writer = csv.writer(stream)
        writer.writerow(fields)
        writer.writerows(rows)
    return path


@pytest.fixture
def csv_inputs(tmp_path):
    geometry = write_csv(tmp_path / 'geometry.csv',
                         ['geometry_id', 'geometry_type', 'outer_dimension_nm', 'inner_dimension_nm'],
                         [['g1', 'circular_disk', 0, 0], ['g2', 'square_ring', 100, 30]])
    rows = [[sid, gid, substrate, wavelength, '', '', value]
            for sid, gid, substrate, values in [('s1', 'g1', 'air', [.74, .75, .76]),
                                                ('s2', 'g2', 'SiO2', [.9, .9, .9])]
            for wavelength, value in zip([500, 505, 510], values)]
    spectra = write_csv(tmp_path / 'spectra.csv',
                        ['simulation_id', 'geometry_id', 'substrate', 'wavelength_nm', 'T', 'R', 'A'], rows)
    requests = write_csv(tmp_path / 'requests.csv',
                         ['band_start_nm', 'band_end_nm', 'target_absorption', 'split'],
                         [[500, 510, .75, 'train'], [500, 510, .9, 'validation'],
                          [500, 510, .8, 'test']])
    return geometry, spectra, requests


def test_prepare_roundtrip_reorder_and_manifest(csv_inputs, tmp_path):
    paths = prepare_dataset(*csv_inputs, tmp_path / 'first')
    data = dataset(paths['data'])
    assert data['geometry'].tolist() == [0, 3, 0]
    assert data['substrate'].tolist() == [0, 1, 0]
    assert data['coordinates'][0].tolist() == [0, 0]
    assert data['coordinates'][1] == pytest.approx([100 / 320, .3])
    assert [data[key].tolist() for key in ('train', 'validation', 'test')] == [[0], [1], [2]]
    validate_preparation(paths['data'], *csv_inputs[:2])
    first = json.loads(paths['selection'].read_text())
    for path in csv_inputs[:2]:
        lines = path.read_text().splitlines()
        path.write_text('\n'.join([lines[0], *reversed(lines[1:])]) + '\n')
    other = prepare_dataset(*csv_inputs, tmp_path / 'second')
    assert json.loads(other['selection'].read_text()) == first
    for key, value in dataset(other['data']).items():
        assert np.array_equal(value, data[key])
    with pytest.raises(ValueError, match='hash'):
        validate_preparation(paths['data'], *csv_inputs[:2])
    with pytest.raises(FileExistsError):
        prepare_dataset(*csv_inputs, tmp_path / 'first')


@pytest.mark.parametrize('change', ['blank', 'duplicate', 'unknown', 'inconsistent', 'range'])
def test_bad_spectra_leave_no_outputs(csv_inputs, tmp_path, change):
    geometry, spectra, requests = csv_inputs
    rows = list(csv.reader(spectra.open()))
    if change == 'blank':
        rows[1][-1] = ''
    elif change == 'duplicate':
        rows.append(rows[1])
    elif change == 'unknown':
        rows[1][1] = 'absent'
    elif change == 'inconsistent':
        rows.pop()
    else:
        rows[1][-1] = '1.5'
    write_csv(spectra, rows[0], rows[1:])
    with pytest.raises(ValueError):
        prepare_dataset(geometry, spectra, requests, tmp_path / 'output')
    assert not (tmp_path / 'output').exists()


@pytest.mark.parametrize('change', ['duplicate', 'empty_split', 'missing_endpoint', 'nan'])
def test_invalid_requests(csv_inputs, tmp_path, change):
    rows = list(csv.reader(csv_inputs[2].open()))
    if change == 'duplicate':
        rows[2][:3] = rows[1][:3]
    elif change == 'empty_split':
        rows[3][-1] = 'train'
    elif change == 'missing_endpoint':
        rows[1][0] = '501'
    else:
        rows[1][2] = 'nan'
    write_csv(csv_inputs[2], rows[0], rows[1:])
    with pytest.raises(ValueError):
        prepare_dataset(*csv_inputs, tmp_path / 'output')
    assert not (tmp_path / 'output').exists()


def test_duplicate_physical_design_rejected(csv_inputs):
    rows = list(csv.reader(csv_inputs[0].open()))
    rows.append(['g3', *rows[1][1:]])
    write_csv(csv_inputs[0], rows[0], rows[1:])
    rows = list(csv.reader(csv_inputs[1].open()))
    rows.extend([['s3', 'g3', *row[2:]] for row in rows[1:4]])
    write_csv(csv_inputs[1], rows[0], rows[1:])
    with pytest.raises(ValueError, match='duplicate physical'):
        load_catalogue(*csv_inputs[:2])


def test_prepared_labels_train_and_evaluate(csv_inputs, tmp_path):
    from inverse_design.core import Architecture
    from inverse_design.training import Config, train, specification
    from inverse_design.physical_evaluation import evaluate_model
    paths = prepare_dataset(*csv_inputs, tmp_path / 'prepared')
    config = Config(data=str(paths['data']), epochs=1, device='cpu')
    before = specification(config)
    result = train(tmp_path / 'model', config, Architecture(depth=1, width=64))
    assert result['epoch'] == 1
    evaluation = evaluate_model(tmp_path / 'model', paths['data'], *csv_inputs[:2],
                                tmp_path / 'evaluation.json', device='cpu')
    assert evaluation['summary']['unverified_count'] == 1
    assert evaluation['records'][0]['worst_error'] is None
    arrays = dataset(paths['data'])
    arrays['geometry'][0] = 1
    np.savez(paths['data'], **arrays)
    assert specification(config) != before
    with pytest.raises(ValueError, match='hash'):
        validate_preparation(paths['data'], *csv_inputs[:2])


@pytest.mark.parametrize('name,index', [('circular_disk', 0), ('square', 1), ('circular_ring', 2), ('square_ring', 3)])
def test_received_class_names(csv_inputs, name, index):
    rows = list(csv.reader(csv_inputs[0].open()))
    rows[1][1] = name
    write_csv(csv_inputs[0], rows[0], rows[1:])
    assert load_catalogue(*csv_inputs[:2])['designs']['s1']['geometry'] == index


def test_interactive_preparation_script(csv_inputs, tmp_path):
    import subprocess
    import sys
    script = Path(__file__).resolve().parents[1] / 'data/prepare_flatness.py'
    output = tmp_path / 'interactive'
    completed = subprocess.run([sys.executable, str(script)],
                               input='\n'.join(str(path) for path in (*csv_inputs, output)) + '\n',
                               capture_output=True, text=True, check=True)
    assert 'Prepared training data:' in completed.stdout
    assert 'Selecting labels' in completed.stderr
    assert len(dataset(output / 'dataset.npz')['x']) == 3
