FROM nvcr.io/nvidia/merlin/merlin-pytorch-training:22.09

# set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PYTHONBREAKPOINT=ipdb.set_trace
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y

# copy kaggle auth
COPY kaggle.json /root/.kaggle/kaggle.json
COPY requirements.txt /workspace/requirements.txt

# install extra python packages
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN jupyter nbextension enable --py widgetsnbextension
RUN CC="cc -mavx2" pip install --no-cache-dir -U --force-reinstall pillow-simd

COPY blazingml /blazingml
RUN cd /blazingml/src && pip install -e .

# verify pillow-simd + libjpegturbo installation
RUN python -c "from PIL import features; print(features.check_feature('libjpeg_turbo'))"
