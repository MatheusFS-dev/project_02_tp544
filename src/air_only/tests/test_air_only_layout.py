"""Active air-only layout and archive-isolation regression checks."""
from pathlib import Path
import ast


def test_active_code_is_namespaced_and_does_not_import_archive():
    root = Path(__file__).resolve().parents[3]
    active = root/'src/air_only'
    assert (active/'flat/common.py').is_file()
    assert (active/'final/train_all.py').is_file()
    assert (active/'data/raw/treinar/HFSS_Base_Dados.py').is_file()
    assert (root/'archive/inverse_design/src/inverse_design').is_dir()
    for directory in ('flat', 'final', 'shared', 'validation'):
        for path in (active/directory).rglob('*.py'):
            for node in ast.walk(ast.parse(path.read_text())):
                if isinstance(node, ast.ImportFrom):
                    assert not (node.module or '').startswith(('inverse_design', 'archive'))
                if isinstance(node, ast.Import):
                    assert all(not name.name.startswith(('inverse_design', 'archive')) for name in node.names)


def test_all_active_configs_resolve_inside_air_only():
    import tomllib
    root = Path(__file__).resolve().parents[1]
    for path in (root/'configs').glob('*.toml'):
        values = tomllib.loads(path.read_text())
        for key in ('data', 'raw'):
            resolved = (path.parent/values[key]).resolve()
            assert resolved.is_relative_to(root)
            assert resolved.exists()
