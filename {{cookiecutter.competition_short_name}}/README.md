## Introduction

This repository contains my solution to the ["{{ cookiecutter.competition_full_name }}"](https://www.kaggle.com/competitions/{{ cookiecutter.competition_long_name }}/) challenge, hosted in Kaggle.

## Installation

First, download the code (and its submodules):

```bash
git clone --recurse-submodules git@github.com:IamGianluca/...
```

For reproducibility, we included a Docker image we used to develop and test the application. We defined the Machine Learning pipeline in [DVC](https://dvc.org/), a version control system for machine learning projects.

You must copy your personal `kaggle.json` file to the project's main directory. This file is used to authenticate to the Kaggle API, and download the competition data from inside the Docker container.

```bash
cp ~/.kaggle/kaggle.json .
```

Build the Docker image and start the Docker container.

```bash
make build && make start
```

Start an interactive bash shell in the container.

```bash
make attach
``` 

Reproduce the DVC pipeline.

```bash
dvc repro
```

## Directory Structure

Here is a brief description of what each folder contains:
* `ckpt`: Model checkpoints
* `data`: Input and pre-processed data
* `mtrc`: Metrics
* `nbs`: Notebooks for exploration analyses
* `pipe`: Python scripts for each step in the DVC pipeline
* `pred`: Predictions
* `ml`: Source code for companion library `blazingai`

Other important files are:
* `dvc.yaml`:  list input, output, and parameters used by each DVC step
* `params.yaml`: parameters used for DVC steps

## Development

If you want to help, please respect this naming convention to tag your commits:

* API relevant changes:
    * `feat`: Commits that add a new feature
    * `fix`: Commits that fixes a bug
* `refactor`: Commits that rewrite/restructure your code but does not change any behavior
    * `perf`: Special `refactor` commits that improve performance
* `style`: Commits that do not affect the meaning (white space, formatting, missing semi-colons, etc.)
* `test`: Commits that add missing tests or correct existing tests
* `docs`: Commits that affect documentation only
* `build`: Commits that affect build components like build tool, CI pipeline, dependencies, project version, etc...
* `ops`: Commits that affect operational components like infrastructure, deployment, backup, recovery, ...
* `chore`: Miscellaneous commits e.g., modifying `.gitignore`

The companion library (`blazingai`) is installed in editable mode. Which means you don't need to rebuild the Docker container every time you make a change to it.

## Tools

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)
- [NVIDIA NGC](https://ngc.nvidia.com/) 
- [DVC](https://github.com/iterative/dvc)
- [PyTorch](https://github.com/pytorch/pytorch)
- [PyTorch Lightning](https://github.com/PyTorchLightning/pytorch-lightning)
- [timm](https://github.com/rwightman/pytorch-image-models/tree/master/timm)
