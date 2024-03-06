## Introduction

Cookiecutter to bootstrap new Kaggle projects. 

## How to use

0. `pyenv activate cookie`
1. `cookiecutter git+ssh://git@github.com/IamGianluca/cookie.git`
2. `cp ~/.kaggle/kaggle.json .`
3. `git init`
4. `make download_ml && make install_ml`
5. `make build && make start`
6. `make attach`
7. Start coding
