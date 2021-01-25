#!/bin/bash -e

files=$(cat dependencies.txt)
storage_ep=https://store.bigwalker.io/tf2.3-cuda10.2-ppc64le

for f in ${files} ; do
  if [ ! -f "${f}" ]; then
    wget $storage_ep/$(python -c "import urllib.parse; print(urllib.parse.quote('''${f}'''))")
  fi
done
