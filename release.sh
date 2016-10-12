#!/usr/bin/env bash

for version in `cat sdk_versions.txt`; do
    docker push gentilhommefx/android-sdk:${version}
done

