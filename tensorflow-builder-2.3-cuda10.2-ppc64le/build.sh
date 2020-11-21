#!/bin/bash -x

REGISTRY=${REGISTRY:-gcr.io/ecp-e4s}

DOCKER_CLI_EXPERIMENTAL=enabled \
DOCKER_BUILDKIT=1 \
 docker build -t "${REGISTRY}/ubuntu18.04-tensorflow-builder-ppc64le:2.3-cuda10.2-cudnn7-tensorrt7-nccl2" .
