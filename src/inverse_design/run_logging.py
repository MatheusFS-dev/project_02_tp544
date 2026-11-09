"""Append runner output to disk while preserving terminal progress."""
from contextlib import redirect_stderr, redirect_stdout
from datetime import datetime
from functools import wraps
from pathlib import Path
import sys


class Tee:
    """Forward text to the terminal and a line-buffered run log."""

    def __init__(self, terminal, logfile):
        self.terminal = terminal
        self.logfile = logfile

    def __getattr__(self, name):
        """Forward stream metadata and capabilities to the original terminal.

        Args:
            name: Requested stream attribute.

        Returns:
            Attribute from the wrapped terminal.
        """
        return getattr(self.terminal, name)

    def write(self, text):
        """Write progress text to both destinations.

        Args:
            text: Output text.

        Returns:
            Number of characters written.
        """
        self.terminal.write(text)
        if not self.logfile.closed:
            self.logfile.write(text)
        self.flush()
        return len(text)

    def flush(self):
        """Flush both destinations so progress remains visible."""
        if not getattr(self.terminal, "closed", False):
            self.terminal.flush()
        if not self.logfile.closed:
            self.logfile.flush()

    def close(self):
        """Flush this non-owning stream without closing the terminal or log."""
        self.flush()

    def isatty(self):
        """Report whether the original terminal supports interactive output."""
        return self.terminal.isatty()


def logged_runner(runner):
    """Decorate a module entry point with persistent console logging.

    Args:
        runner: TOML configuration name.

    Returns:
        Decorator that appends stdout, stderr and failures to a runner log.
    """
    def decorate(main):
        @wraps(main)
        def execute():
            from .training import load_config
            import traceback
            config = load_config(runner)
            directory = Path(config.output) / 'logs'
            directory.mkdir(parents=True, exist_ok=True)
            path = directory / f'{runner}.log'
            with path.open('a', buffering=1) as logfile:
                with redirect_stdout(Tee(sys.stdout, logfile)), redirect_stderr(Tee(sys.stderr, logfile)):
                    print(f'{datetime.now().isoformat()} Starting {runner}. Log: {path}', flush=True)
                    try:
                        result = main()
                    except BaseException:
                        traceback.print_exc()
                        raise
                    print(f'{datetime.now().isoformat()} Completed {runner}', flush=True)
                    return result
        return execute
    return decorate
