#!/usr/bin/env bash

export CC_OPT_FLAGS="-mcpu=powerpc64le -Wno-sign-compare"

export TF_NEED_ROCM=0
export TF_NEED_CUDA=1
export TF_CUDA_VERSION=10
export TF_CUDA_PATHS=/usr,/usr/local/cuda,/usr/local/TensorRT-7.0.0.11
export TF_CUDA_COMPUTE_CAPABILITIES=3.5,7.0
export TF_CUDA_CLANG=0

export TF_CUDNN_VERSION=7

export TF_NEED_TENSORRT=1
export TF_TENSORRT_VERSION=7

export TF_NCCL_VERSION=2

export GCC_HOST_COMPILER_PATH=/usr/bin/gcc

export TF_SET_ANDROID_WORKSPACE=0

export PYTHON_BIN_PATH=/usr/local/miniconda3/envs/py36/bin/python
export USE_DEFAULT_PYTHON_LIB_PATH=1

yes "" | ./configure
