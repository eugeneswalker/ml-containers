#!/bin/bash -x

REGISTRY=${REGISTRY:-gcr.io/ecp-e4s}

DOCKER_CLI_EXPERIMENTAL=enabled \
DOCKER_BUILDKIT=1 \
 docker build -t "${REGISTRY}/ubuntu18.04-cuda-ppc64le:10.2-cudnn7-tensorrt7-nccl2" .
