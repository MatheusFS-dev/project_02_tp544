"""Received Treinar geometry conversion regressions."""
import csv
from pathlib import Path
import pytest
import numpy as np


def test_treinar_conversion_preserves_units_deduplicates_and_lists_exclusions(tmp_path):
    from inverse_design.treinar import convert_catalogue
    raw = tmp_path / 'raw'
    (raw / 'Espectros_TRA').mkdir(parents=True)
    with (raw / 'geometrias_sorteadas.csv').open('w', newline='') as stream:
        writer = csv.writer(stream)
        writer.writerow(['id', 'familia', 'R_d', 'L_s', 'Rout_c', 'w_c', 'Lout_q', 'w_q'])
        writer.writerows([
            ['g1', 'F01', 40, '', '', '', '', ''],
            ['g2', 'F01', 40, '', '', '', '', ''],
            ['g3', 'F03', '', '', 80, 20, '', ''],
            ['g4', 'F05', '', '', 50, 10, 200, 20],
        ])
    for gid in ('g1', 'g2', 'g3', 'g4'):
        (raw / 'Espectros_TRA' / f'{gid}.csv').write_text('lambda_nm,T,R,A\n500,0.2,0.3,0.5\n600,0.3,0.3,0.4\n')
    output = tmp_path / 'out'
    audit = convert_catalogue(raw, output)
    rows = list(csv.DictReader((output / 'geometries.csv').open()))
    assert [(r['geometry_type'], float(r['outer_dimension_nm']), float(r['inner_dimension_nm'])) for r in rows] == [
        ('circular_disk', 80, 0), ('circular_ring', 160, 120)]
    assert audit['excluded_ids'] == ['g4']
    assert audit['duplicate_ids'] == {'g2': 'g1'}
    from inverse_design.preparation import load_catalogue
    catalogue = load_catalogue(output / 'geometries.csv', output / 'spectra.csv')
    np.testing.assert_array_equal(catalogue['wavelengths'], [500, 600])
    assert len(catalogue['spectra']) == 2
    (raw / 'Espectros_TRA' / 'g2.csv').write_text('lambda_nm,T,R,A\n500,0.1,0.3,0.6\n600,0.3,0.3,0.4\n')
    with pytest.raises(ValueError, match='duplicate.*spectra'):
        convert_catalogue(raw, tmp_path / 'conflict')
