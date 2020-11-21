FROM ecpe4s/ubuntu18.04-runner-x86_64:2020-09-01

RUN apt update -y \
 && apt upgrade -y \
 && apt clean

RUN wget -q -O - https://repo.radeon.com/rocm/rocm.gpg.key | apt-key add - \
 && echo 'deb [arch=amd64] https://repo.radeon.com/rocm/apt/debian/ xenial main' | tee /etc/apt/sources.list.d/rocm.list \
 && apt update -y \
 && apt install -y rocm-dev \
 && apt install -y \
    hipblas \
    hipcub \
    hipsparse \
    miopen-hip \
    miopengemm \
    rccl \
    rocfft \
    rocm-libs \
    rocm-utils \
    rocprim \
    rocrand \
    rocsparse \
    kmod \
 && apt clean
