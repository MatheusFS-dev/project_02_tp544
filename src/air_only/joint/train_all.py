"""Train all four selected topologies independently on joint air + silica data."""
from air_only.joint.workflow import configuration, joint_data, train_case, CASES
from tqdm import tqdm


def main():
    """Resume four joint trainings without repeating architecture searches."""
    config, sources, _ = configuration()
    joint_data(config)
    for case in tqdm(CASES, desc='Joint model training', unit='model'):
        train_case(case, config, sources[case])
    print('All four joint models are available under '+config.output, flush=True)


if __name__ == '__main__':
    main()
