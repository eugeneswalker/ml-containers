# syntax=docker/dockerfile:experimental

FROM gcr.io/ecp-e4s/ubuntu18.04-runner-x86_64:2021-01-01

RUN --mount=type=bind,source=cuda_11.2.0_460.27.04_linux.run,target=cuda_11.2.0_460.27.04_linux.run \
    sh cuda_11.2.0_460.27.04_linux.run --silent --toolkit

RUN --mount=type=bind,source=libcudnn8_8.0.5.39-1+cuda11.1_amd64.deb,target=libcudnn8_8.0.5.39-1+cuda11.1_amd64.deb \
    --mount=type=bind,source=libcudnn8-dev_8.0.5.39-1+cuda11.1_amd64.deb,target=libcudnn8-dev_8.0.5.39-1+cuda11.1_amd64.deb \
    dpkg -i libcudnn8_8.0.5.39-1+cuda11.1_amd64.deb \
 && dpkg -i libcudnn8-dev_8.0.5.39-1+cuda11.1_amd64.deb

RUN --mount=type=bind,source=TensorRT-7.2.2.3.Ubuntu-18.04.x86_64-gnu.cuda-11.1.cudnn8.0.tar.gz,target=TensorRT-7.2.2.3.Ubuntu-18.04.x86_64-gnu.cuda-11.1.cudnn8.0.tar.gz \
    tar xzvf TensorRT-7.2.2.3.Ubuntu-18.04.x86_64-gnu.cuda-11.1.cudnn8.0.tar.gz -C /usr/local \
 && echo /usr/local/TensorRT-7.2.2.3/lib > /etc/ld.so.conf.d/tensorrt-7.2.2.3.conf \
 && cd /usr/local/TensorRT-7.2.2.3 \
 && pip install 'numpy<1.19.0' \
 && pip install python/tensorrt-7.2.2.3-cp36-none-linux_x86_64.whl \
 && pip install uff/uff-0.6.9-py2.py3-none-any.whl \
 && pip install graphsurgeon/graphsurgeon-0.4.5-py2.py3-none-any.whl \
 && cd /

COPY 7fa2af80.pub /

RUN --mount=type=bind,source=nccl-repo-ubuntu1804-2.8.3-ga-cuda11.2_1-1_amd64.deb,target=nccl-repo-ubuntu1804-2.8.3-ga-cuda11.2_1-1_amd64.deb \
    apt-key add 7fa2af80.pub \
 && dpkg -i nccl-repo-ubuntu1804-2.8.3-ga-cuda11.2_1-1_amd64.deb \
 && apt update -y \
 && apt install -y libnccl2=2.8.3-1+cuda11.2 libnccl-dev=2.8.3-1+cuda11.2 \
 && rm -rf /var/nccl-repo-2.8.3-ga-cuda11.2 /etc/apt/sources.list.d/nccl-2.8.3-ga-cuda11.2.list \
 && apt clean -y

RUN rm -f /*.deb /*.run /*.tar.gz /*.whl
