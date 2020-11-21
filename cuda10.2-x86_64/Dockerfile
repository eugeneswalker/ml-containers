# syntax=docker/dockerfile:experimental

FROM ecpe4s/ubuntu18.04-runner-x86_64:2020-09-01

RUN --mount=type=bind,source=cuda_10.2.89_440.33.01_linux.run,target=cuda_10.2.89_440.33.01_linux.run \
    sh cuda_10.2.89_440.33.01_linux.run --silent --toolkit

RUN --mount=type=bind,source=libcudnn7_7.6.5.32-1+cuda10.2_amd64.deb,target=libcudnn7_7.6.5.32-1+cuda10.2_amd64.deb \
    --mount=type=bind,source=libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb,target=libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb \
    dpkg -i libcudnn7_7.6.5.32-1+cuda10.2_amd64.deb \
 && dpkg -i libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb

RUN --mount=type=bind,source=TensorRT-7.0.0.11.Ubuntu-18.04.x86_64-gnu.cuda-10.2.cudnn7.6.tar.gz,target=TensorRT-7.0.0.11.Ubuntu-18.04.x86_64-gnu.cuda-10.2.cudnn7.6.tar.gz \
    tar xzvf TensorRT-7.0.0.11.Ubuntu-18.04.x86_64-gnu.cuda-10.2.cudnn7.6.tar.gz -C /usr/local \
 && echo /usr/local/TensorRT-7.0.0.11/lib > /etc/ld.so.conf.d/tensorrt-7.0.0.11.conf \
 && cd /usr/local/TensorRT-7.0.0.11 \
 && pip install 'numpy<1.19.0' \
 && pip install python/tensorrt-7.0.0.11-cp36-none-linux_x86_64.whl \
 && pip install uff/uff-0.6.5-py2.py3-none-any.whl \
 && pip install graphsurgeon/graphsurgeon-0.4.1-py2.py3-none-any.whl \
 && cd /

RUN --mount=type=bind,source=nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb,target=nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub \
 && dpkg -i nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb \
 && apt update -y \
 && apt install libnccl2=2.7.8-1+cuda10.2 libnccl-dev=2.7.8-1+cuda10.2 \
 && apt clean

RUN rm -f /*.deb /*.run /*.tar.gz /*.whl
