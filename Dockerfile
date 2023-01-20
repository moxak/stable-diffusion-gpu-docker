# syntax=docker/dockerfile:1

FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime 

COPY . /app

WORKDIR /app

RUN tar -zxvf packages.tar.gz && dpkg -i packages/*

RUN pip install -r requirements.txt

RUN tar -zxvf stable-diffusion.tar.gz 

RUN mkdir -p /root/.cache/torch/hub/checkpoints/ && mv checkpoint_liberty_with_aug.pth /root/.cache/torch/hub/checkpoints/

WORKDIR /app/stable-diffusion

RUN pip install -e .

RUN mkdir -p shared