FROM nvcr.io/nvidia/pytorch:24.02-py3

# set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV TERM screen-256color
ENV PYTHONBREAKPOINT=ipdb.set_trace
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV TOKENIZERS_PARALLELISM=false

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y

# copy kaggle auth
COPY kaggle.json /root/.kaggle/kaggle.json
COPY requirements.txt /workspace/requirements.txt

# install extra python packages
RUN python -m pip install --upgrade pip
RUN pip install -r /workspace/requirements.txt
# RUN jupyter nbextension enable --py widgetsnbextension

# install personal ml library
COPY blazingai /workspace/blazingai
RUN pip install -e /workspace/blazingai

## dependencies for dev environment
RUN pip install ansible
RUN ansible-pull -U https://github.com/iamgianluca/ansible.git headless.yml

# make sure libjpeg-turbo is installed properly
RUN python -c "from PIL import features; print(features.check_feature('libjpeg_turbo'))"
