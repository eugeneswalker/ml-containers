#!/bin/bash -x

REGISTRY=${REGISTRY:-gcr.io/ecp-e4s}

DOCKER_CLI_EXPERIMENTAL=enabled \
DOCKER_BUILDKIT=1 \
 docker build -t "${REGISTRY}/ubuntu18.04-cuda-x86_64:10.2-cudnn7-tensorrt7-nccl2" .
