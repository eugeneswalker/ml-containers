FROM gcr.io/ecp-e4s/ubuntu18.04-rocm-x86_64:3.9

RUN apt update -y \
 && apt install curl gnupg \
 && curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/bazel.gpg \
 && echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
 && apt update -y \
 && apt install bazel-3.1.0 \
 && apt clean \
 && ln -s /usr/bin/bazel-3.1.0 /usr/bin/bazel

RUN pip install -U --no-cache-dir pip \
 && pip install -U --no-cache-dir six wheel setuptools mock 'future>=0.17.1' \
 && pip install -U --no-cache-dir 'numpy<1.19.0' \
 && pip install -U --no-cache-dir --no-deps keras_preprocessing keras_applications \
 && rm -rf /root/.cache

RUN git clone https://github.com/ROCmSoftwarePlatform/tensorflow-upstream.git tensorflow \
 && (cd tensorflow && git checkout 726fd1081eaa6955f8f37c4f58b8b1cab2252acc)
