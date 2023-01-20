## stable-diffusion-gpu-docker

loading weights from [[CompVis/stable-diffusion-v-1-4-original]](https://huggingface.co/CompVis/stable-diffusion-v-1-4-original) as `model.ckpt`.

### Build

```bash
docker build -t stable-diffusion-gpu-docker .
```

### Run

```bash
docker run --gpus all -it --rm -v ${PWD}/shared:/app/stable-diffusion/shared stable-diffusion-gpu-docker /bin/bash

---
# text-to-image
python scripts/txt2img.py --prompt "a photograph of an astronaut riding a horse" --plms --n_samples 1 --skip_grid --outdir shared/outputs/txt2img-samples

# image-to-image
python scripts/img2img.py --prompt "A fantasy landscape, trending on artstation" --init-img shared/inputs/sketch-mountains-input.jpg --strength 0.8 --outdir shared/outputs/img2img-samples
```

### Distribute

```bash
docker pull docker/dockerfile:1
docker pull pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime

docker save docker/dockerfile:1 -o dockerimages/img_dockerfile-1.tar
docker save pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime -o dockerimages/img_pytorch-cuda-runtime.tar
docker save stable-diffusion-gpu-docker -o dockerimages/img_stable-diffusion-gpu-docker.tar
```