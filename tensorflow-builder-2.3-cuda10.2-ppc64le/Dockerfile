# syntax=docker/dockerfile:experimental

FROM us.gcr.io/ecp-e4s/ubuntu18.04-cuda-ppc64le:10.2-cudnn7-tensorrt7-nccl2

RUN --mount=type=bind,source=bazel_bin_ppc64le_3.1.0,target=bazel_bin_ppc64le_3.1.0 \
    cp bazel_bin_ppc64le_3.1.0 /usr/bin/bazel \
 && chmod +x /usr/bin/bazel

RUN --mount=type=bind,source=Miniconda3-latest-Linux-ppc64le.sh,target=Miniconda3-latest-Linux-ppc64le.sh \
    sh Miniconda3-latest-Linux-ppc64le.sh -b -p /usr/local/miniconda3

RUN eval "$(/usr/local/miniconda3/bin/conda shell.bash hook)" \
 && conda init \
 && conda create -n py36 python=3.6

RUN eval "$(/usr/local/miniconda3/bin/conda shell.bash hook)" \
 && conda activate py36 \
 && pip install -U pip \
 && pip install -U six wheel setuptools mock 'future>=0.17.1' \
 && pip install -U 'numpy<1.19.0' \
 && pip install -U --no-deps keras_preprocessing keras_applications \
 && rm -rf /root/.cache

RUN eval "$(/usr/local/miniconda3/bin/conda shell.bash hook)" \
 && conda activate py36 \
 && cd /usr/local/TensorRT-7.0.0.11 \
 && pip install python/tensorrt-7.0.0.11-cp36-none-linux_ppc64le.whl \
 && pip install uff/uff-0.6.5-py2.py3-none-any.whl \
 && pip install graphsurgeon/graphsurgeon-0.4.1-py2.py3-none-any.whl \
 && rm -rf /root/.cache \
 && cd /

RUN git clone https://github.com/tensorflow/tensorflow.git /tensorflow \
 && (cd /tensorflow && git checkout v2.3.1)

WORKDIR /tensorflow

RUN apt update -y \
 && apt install -y openjdk-11-jdk-headless \
 && apt clean -y

RUN echo conda activate py36 >> /root/.bashrc

RUN rm -f /*.deb /*.run /*.tar.gz /*.whl
