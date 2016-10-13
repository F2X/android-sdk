# android-sdk
Android SDK docker

## How to build an image with a specific sdk version?

`docker build --pull --build-arg SDK_VERSION=${version} --build-arg ACCEPT_LICENSES=y -t gentilhommefx/android-sdk:${custom-tag} .`

## How to customize installed packages?

`docker build --pull --build-arg FILTERED_PACKAGES=${packages} --build-arg ACCEPT_LICENSES=y -t gentilhommefx/android-sdk:${custom-tag} .`

Where `${packages}` is a comma separated list of features, e.g. `tool,platform-tool,android-24`. It cannot be used at the same time than `--build-arg SDK_VERSION=${version}`.
