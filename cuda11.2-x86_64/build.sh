#!/bin/bash -x

REGISTRY=${REGISTRY:-gcr.io/ecp-e4s}

DOCKER_CLI_EXPERIMENTAL=enabled \
DOCKER_BUILDKIT=1 \
 docker build -t "${REGISTRY}/ubuntu18.04-cuda-x86_64:11.2-cudnn8-tensorrt7-nccl2" .
