# syntax=docker/dockerfile:experimental

FROM us.gcr.io/ecp-e4s/ubuntu18.04-runner-ppc64le:2021-01-01

RUN --mount=type=bind,source=cuda_10.2.89_440.33.01_linux_ppc64le.run,target=cuda_10.2.89_440.33.01_linux_ppc64le.run \
    mkdir -p /cuda-10.2.89/targets/ppc64le-linux/include /cuda-10.2.89/src \
 && ln -s targets/ppc64le-linux/include /cuda-10.2.89/include \
 && sh cuda_10.2.89_440.33.01_linux_ppc64le.run --silent --toolkit --override --installpath=/cuda-10.2.89 \
 && mv /cuda-10.2.89 /usr/local \
 && rm -rf /usr/local/cuda \
 && ln -s /usr/local/cuda-10.2.89 /usr/local/cuda \
 && echo /usr/local/cuda/lib64 > /etc/ld.so.conf.d/cuda-10-2.conf

RUN --mount=type=bind,source=libcudnn7_7.6.5.32-1+cuda10.2_ppc64el.deb,target=libcudnn7_7.6.5.32-1+cuda10.2_ppc64el.deb \
    --mount=type=bind,source=libcudnn7-dev_7.6.5.32-1+cuda10.2_ppc64el.deb,target=libcudnn7-dev_7.6.5.32-1+cuda10.2_ppc64el.deb \
    dpkg -i libcudnn7_7.6.5.32-1+cuda10.2_ppc64el.deb \
 && dpkg -i libcudnn7-dev_7.6.5.32-1+cuda10.2_ppc64el.deb

RUN --mount=type=bind,source=TensorRT-7.0.0.11.Ubuntu-18.04.ppc64le-gnu.cuda-10.2.cudnn7.6.tar.gz,target=TensorRT-7.0.0.11.Ubuntu-18.04.ppc64le-gnu.cuda-10.2.cudnn7.6.tar.gz \
    tar xzvf TensorRT-7.0.0.11.Ubuntu-18.04.ppc64le-gnu.cuda-10.2.cudnn7.6.tar.gz -C /usr/local \
 && echo /usr/local/TensorRT-7.0.0.11/lib > /etc/ld.so.conf.d/tensorrt-7.0.0.11.conf \
 && cd /usr/local/TensorRT-7.0.0.11 \
 && pip install 'numpy<1.19.0' \
 && pip install python/tensorrt-7.0.0.11-cp36-none-linux_ppc64le.whl \
 && pip install uff/uff-0.6.5-py2.py3-none-any.whl \
 && pip install graphsurgeon/graphsurgeon-0.4.1-py2.py3-none-any.whl \
 && cd /

COPY 7fa2af80.pub /

RUN --mount=type=bind,source=nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_ppc64el.deb,target=nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_ppc64el.deb \
    apt-key add 7fa2af80.pub \
 && dpkg -i nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_ppc64el.deb \
 && apt update -y \
 && apt install libnccl2=2.7.8-1+cuda10.2 libnccl-dev=2.7.8-1+cuda10.2 \
 && apt clean

RUN rm -f /*.deb /*.run /*.tar.gz /*.whl /*.pub
