"""Atomic, checksummed checkpoints and exclusive process ownership."""
from contextlib import contextmanager
import fcntl
import hashlib
import json
import os
from pathlib import Path
import pickle
import tempfile


def atomic(path, content):
    """Durably replace a file with bytes on the same filesystem.

    Args:
        path: Destination filename, whose parent directory will be created.
        content: Complete bytes to write before atomic replacement."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, name = tempfile.mkstemp(dir=path.parent, prefix='.pending-')
    try:
        with os.fdopen(fd, 'wb') as stream:
            stream.write(content)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(name, path)
        directory = os.open(path.parent, os.O_DIRECTORY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    finally:
        if os.path.exists(name):
            os.unlink(name)


def save_json(path, value):
    """Write a JSON document atomically.

    Args:
        path: Destination filename.
        value: JSON-compatible object containing no nonfinite floats."""
    atomic(path, json.dumps(value, indent=2, sort_keys=True, allow_nan=False).encode())


def digest(value):
    """Hash a JSON-compatible specification.

    Args:
        value: JSON-compatible object whose keys are sorted before hashing.

    Returns:
        Hexadecimal SHA-256 digest."""
    return hashlib.sha256(json.dumps(value, sort_keys=True).encode()).hexdigest()


@contextmanager
def ownership(directory):
    """Hold a nonblocking kernel lock until context exit or process death.

    Args:
        directory: Run directory to create and lock.

    Yields:
        Path to the exclusively owned run directory.

    Raises:
        RuntimeError: Another process already owns the directory."""
    directory = Path(directory)
    directory.mkdir(parents=True, exist_ok=True)
    with (directory / '.lock').open('a') as stream:
        try:
            fcntl.flock(stream, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as exc:
            raise RuntimeError(f'run directory already owned: {directory}') from exc
        try:
            yield directory
        finally:
            fcntl.flock(stream, fcntl.LOCK_UN)


def manifest(directory, specification):
    """Create a fingerprint or reject an incompatible resume.

    Args:
        directory: Existing run directory.
        specification: JSON-compatible identity of the run.

    Returns:
        Hexadecimal specification fingerprint.

    Raises:
        ValueError: A retained manifest describes a different run."""
    path = Path(directory) / 'manifest.json'
    value = dict(fingerprint=digest(specification), specification=specification)
    if path.exists() and json.loads(path.read_text()) != value:
        raise ValueError(f'incompatible resume configuration, dataset or split: {path}')
    save_json(path, value)
    return value['fingerprint']


def pack(state):
    """Encode a local trusted checkpoint with a SHA-256 integrity prefix.

    Args:
        state: Pickle-compatible checkpoint state.

    Returns:
        Digest-prefixed serialized bytes."""
    body = pickle.dumps(state, protocol=5)
    return hashlib.sha256(body).digest() + body


def unpack(path):
    """Verify integrity before deserializing a trusted local checkpoint.

    Args:
        path: Trusted local checkpoint filename.

    Returns:
        Deserialized state after checksum validation.

    Raises:
        ValueError: The checksum does not match the checkpoint body."""
    content = Path(path).read_bytes()
    if hashlib.sha256(content[32:]).digest() != content[:32]:
        raise ValueError(f'checkpoint integrity failure: {path}')
    return pickle.loads(content[32:])


def load(directory, fingerprint=None):
    """Load the newest valid generation, rejecting incompatible checkpoints.

    Args:
        directory: Run directory containing epoch checkpoint generations.
        fingerprint: Expected identity, or None to skip identity comparison.

    Returns:
        Newest valid state, or None when no epoch checkpoint exists.

    Raises:
        ValueError: No generation is valid or its fingerprint is incompatible."""
    paths = sorted(Path(directory).glob('epoch-*.ckpt'), reverse=True)
    errors = []
    for path in paths:
        try:
            state = unpack(path)
        except (ValueError, EOFError, pickle.UnpicklingError) as exc:
            errors.append(str(exc))
            continue
        if fingerprint is not None and state['fingerprint'] != fingerprint:
            raise ValueError('incompatible checkpoint fingerprint')
        return state
    if paths:
        raise ValueError('no valid checkpoint generations: ' + ', '.join(errors))
    return None


def save(directory, state):
    """Retain the latest two verified generations and the best model state.

    Args:
        directory: Owned run directory.
        state: Complete epoch state, including architecture and best weights."""
    directory = Path(directory)
    atomic(directory / f"epoch-{state['epoch']:04d}.ckpt", pack(state))
    valid = []
    for path in sorted(directory.glob('epoch-*.ckpt'), reverse=True):
        try:
            unpack(path)
            valid.append(path)
        except (ValueError, EOFError, pickle.UnpicklingError):
            path.unlink()
    for path in valid[2:]:
        path.unlink()
    atomic(directory / 'best.ckpt', pack(dict(architecture=state['architecture'],
           weights=state['best_weights'])))
