#!/usr/bin/env bash

commit=$(git describe --tags --long --always)
branch=$(git rev-parse --abbrev-ref HEAD)

for version in `cat sdk_versions.txt`; do
    docker build --pull --build-arg SDK_VERSION=${version} --build-arg ACCEPT_LICENSES=y -t gentilhommefx/android-sdk:${version} .
done

