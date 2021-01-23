#!/bin/bash -x

REGISTRY=${REGISTRY:-us.gcr.io/ecp-e4s}

DOCKER_CLI_EXPERIMENTAL=enabled \
DOCKER_BUILDKIT=1 \
 docker build -t "${REGISTRY}/ubuntu18.04-tensorflow-x86_64:2.3-cuda10.2-cudnn7-tensorrt7-nccl2" .
