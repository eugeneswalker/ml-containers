#!/bin/bash -x

REGISTRY=${REGISTRY:-gcr.io/ecp-e4s}

docker build -t "${REGISTRY}/ubuntu18.04-rocm-x86_64:3.9" .
