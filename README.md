# Self-Imitation Learning for Actor–Critic Algorithms

Platform-level integration of Self-Imitation Learning (SIL) as a configurable plug-and-play module for PPO, TD3, and SAC within the UoA CARES reinforcement learning platform.

This project was completed as part of my Master of Robotics and Automation Engineering research at the University of Auckland.

## Project Overview

Self-Imitation Learning enables an agent to reuse its own past successful experiences as an additional learning signal.

In this project, SIL was implemented as a modular component within an existing reinforcement learning platform and integrated with multiple Actor–Critic algorithms. The work focused on:

- developing a unified SIL framework for different Actor–Critic algorithms;
- implementing algorithm-specific adapters for PPO, TD3, and SAC;
- enabling SIL configuration through training command-line arguments;
- validating SIL across multiple continuous-control environments;
- investigating Dynamic Reward Scaling (DRS) as an enhancement method to improve SIL generalisation.

The original implementation was developed in private UoA CARES laboratory repositories. This repository provides a portfolio overview of the architecture, engineering implementation, methodology, and selected experimental results.

## Development Platform

The implementation was developed across two UoA CARES repositories:

- **Reinforcement learning platform:**  
  [cares_reinforcement_learning — SIL_WIP branch](https://github.com/UoA-CARES/cares_reinforcement_learning/tree/SIL_WIP)

- **Customised environments:**  
  [gymnasium_environments — SIL_WIP branch](https://github.com/UoA-CARES/gymnasium_envrionments/tree/SIL_WIP)

The customised environment repository was used to support experimental integration with environments including:

- MuJoCo;
- DeepMind Control Suite;
- additional Gymnasium-compatible continuous-control environments.

> The original `SIL_WIP` branches are maintained within the UoA CARES repositories and may not be publicly accessible.

## Features

- **Plug-and-play integration within the UoA CARES RL platform:**  
  SIL is implemented as a reusable module that can be enabled for supported Actor–Critic algorithms within the existing platform architecture.

- **Command-line activation and configuration:**  
  SIL can be enabled or disabled directly through the main training command. SIL settings and hyperparameters can also be configured using command-line arguments.

- **Unified SIL interface:**  
  Experience collection, SIL-buffer management, filtering, replay sampling, and SIL updates are managed through a shared framework.

- **Algorithm-specific integration adapters:**  
  Dedicated adapters connect SIL to PPO, SAC, and TD3 by handling their different policy representations and critic interfaces.

  - PPO evaluates stored state–action pairs through its stochastic policy interface.
  - SAC reconstructs the squashed action distribution to evaluate stored actions.
  - TD3 uses deterministic action matching as an alternative to action log-likelihood.

- **On-policy and off-policy support:**  
  The implementation supports both on-policy and off-policy Actor–Critic algorithms while preserving a consistent SIL workflow.

- **Supported algorithms:**  
  PPO, TD3, and SAC.

- **Custom environment integration:**  
  The implementation works with the corresponding customised `gymnasium_environments` code from the `SIL_WIP` branch.

## SIL Integration Architecture

The following diagram illustrates the platform-level integration of the SIL module with the supported Actor–Critic algorithms.

![SIL integration architecture](figures/sil_integration_architecture.png)

The SIL module operates alongside the base algorithm training process. It manages its own experience collection, filtering, replay storage, and additional policy and value updates while sharing the Actor–Critic networks of the base algorithm.

## SIL Framework

The framework separates SIL into several modular stages:

1. episodic experience collection;
2. Monte Carlo return calculation;
3. SIL experience filtering;
4. replay-buffer storage;
5. base Actor–Critic updates;
6. configurable SIL update intervals;
7. repeated SIL policy and value updates.

![Modular SIL framework](figures/sil_framework.png)

This structure allows SIL to be integrated into multiple algorithms while maintaining a unified training workflow.

## SIL Pseudocode

The following pseudocode summarises the modular SIL training process implemented in this project.

![SIL pseudocode](figures/sil_pseudocode.png)

The complete mathematical formulation and detailed methodology are documented in the full Master’s thesis.

## Selected Results

### SIL with Actor–Critic Algorithms

SIL was evaluated with PPO, TD3, and SAC to investigate whether the method could generalise across different Actor–Critic algorithm structures.

The experiments examined:

- training performance;
- learning stability;
- algorithm-specific SIL update requirements;
- differences between on-policy and off-policy learning;
- task-dependent performance across continuous-control environments.

![SIL results across PPO, TD3, and SAC](figures/sil_ac_results.png)

Key observations included:

- SIL was successfully integrated with PPO, TD3, and SAC through the unified platform-level framework.
- SIL produced meaningful improvements in several MuJoCo tasks.
- Off-policy algorithms generally required a lower SIL update intensity than PPO.
- The effectiveness of SIL varied across algorithms and environments.
- Generalisation to DeepMind Control Suite tasks was more task-dependent than in MuJoCo.

### Dynamic Reward Scaling for Improved Generalisation

Dynamic Reward Scaling (DRS) was investigated as an enhancement method for improving the quality and comparability of experiences stored in the SIL replay buffer.

![SIL with Dynamic Reward Scaling results](figures/sil_drs_results.png)

Selected findings included:

- DRS improved several TD3 and SAC results.
- DRS helped reduce sensitivity to reward-scale differences in some environments.
- The benefit was stronger for selected off-policy experiments.
- DRS was not consistently beneficial for PPO.
- The results indicate that SIL enhancement methods should be adapted to the characteristics of the base algorithm and environment.

## Research Scope

The full research included:

- SIL implementation and validation;
- platform-level integration with PPO, TD3, and SAC;
- algorithm-specific actor and critic adapters;
- MuJoCo and DeepMind Control Suite experiments;
- hyperparameter and update-frequency analysis;
- gradient-clipping investigation;
- Dynamic Reward Scaling;
- generalisation analysis;
- limitations and future research directions.

## Master’s Thesis

The full thesis contains the complete:

- research background;
- literature review;
- methodology;
- mathematical formulation;
- implementation details;
- experimental design;
- results;
- analysis;
- limitations;
- future work.

**Full thesis available upon request.**

## Repository Scope

This repository currently provides a concise portfolio presentation of the project, including:

- development platform;
- integration architecture;
- engineering features;
- SIL framework;
- pseudocode;
- selected experimental results.

Additional technical documentation, implementation details, and independently publishable code may be added in future updates.
