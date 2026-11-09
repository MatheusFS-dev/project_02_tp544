"""Design flat absorption using only the autokeras final surrogate."""
from flat.optimize import run_case


def main():
    """Load the autokeras final model and ask only for the absorption request."""
    run_case('autokeras')


if __name__ == '__main__':
    main()
