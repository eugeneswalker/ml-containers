#!/bin/bash -x

REGISTRY=${REGISTRY:-us.gcr.io/ecp-e4s}

DOCKER_CLI_EXPERIMENTAL=enabled \
DOCKER_BUILDKIT=1 \
 docker build -t "${REGISTRY}/ubuntu18.04-tensorflow-x86_64:2.4-cuda11.2-cudnn8-tensorrt7-nccl2" .
