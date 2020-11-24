#!/bin/bash -x

REGISTRY=${REGISTRY:-us.gcr.io/ecp-e4s}

docker build -t "${REGISTRY}/ubuntu18.04-tensorflow-builder-x86_64:2.3-rocm3.9" .
