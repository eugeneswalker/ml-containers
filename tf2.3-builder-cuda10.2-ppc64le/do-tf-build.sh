#!/bin/bash

bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package --verbose_failures

./bazel-bin/tensorflow/tools/pip_package/build_pip_package /
