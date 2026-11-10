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

