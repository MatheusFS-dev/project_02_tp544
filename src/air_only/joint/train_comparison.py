"""Train the four selected topologies on the joint 70/15/15 split and evaluate the test split once."""
from air_only.joint.workflow import configuration, joint_data, train_case, CASES
from tqdm import tqdm


def main():
    """Resume four joint comparison trainings without architecture searches."""
    config, sources, _ = configuration('joint_comparison')
    joint_data(config)
    for case in tqdm(CASES, desc='Joint comparison training', unit='model'):
        train_case(case, config, sources[case], evaluate_test=True)
    print('All four joint comparison models are available under '+config.output, flush=True)


if __name__ == '__main__':
    main()
