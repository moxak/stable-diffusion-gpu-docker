#!/bin/bash

## Loading docker images
docker load -i dockerimages/img_dockerfile-1.tar
docker load -i dockerimages/img_pytorch-cuda-runtime.tar
docker load -i dockerimages/img_stable-diffusion-gpu-docker.tar


## Download tar.gz files
# wget xxxx
# wget xxxx
# wget xxxx

docker images