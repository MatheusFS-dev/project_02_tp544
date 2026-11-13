"""Regression coverage for learning-curve partition isolation."""
import numpy as np
from air_only.validation.presentation.sweep import nested_rows


def test_nested_stratified_training_only():
    families = np.repeat(np.arange(12), 20)
    training = np.concatenate([np.arange(i*20, i*20+14) for i in range(12)])
    previous = set()
    for fraction in (.1, .25, .5, .75, 1.):
        rows = nested_rows(training, families, fraction, 42)
        assert previous <= set(rows) <= set(training)
        assert len(np.unique(rows)) == len(rows)
        assert len(rows) == round(len(training)*fraction)
        assert len(np.unique(families[rows])) == 12
        assert np.array_equal(rows, nested_rows(training, families, fraction, 42))
        previous = set(rows)
    assert set(rows) == set(training)


def test_resumed_summary_preserves_completed_fits(tmp_path):
    from air_only.validation.presentation.sweep import retained_results
    import json
    path = tmp_path/'curve.json'
    assert retained_results(path, 'real-hash') == []
    record = dict(case='baseline', seed=42, fraction=.1, test={'count':289})
    path.write_text(json.dumps(dict(source_dataset_sha256='real-hash', results=[record])))
    assert retained_results(path, 'real-hash') == [record]
    import pytest
    with pytest.raises(ValueError, match='source dataset'):
        retained_results(path, 'different-hash')
