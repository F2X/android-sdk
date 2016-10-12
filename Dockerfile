FROM openjdk:8
MAINTAINER François-Xavier Gentilhomme <gentilhomme.fx@outlook.com>

RUN dpkg --add-architecture i386 && \
	apt update -qq -y && \
	apt install -y \
		libc6:i386 \
		libncurses5:i386 \
		libstdc++6:i386 \
		lib32z1 && \
	apt-get clean autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt

ARG SDK_VERSION
ARG ACCEPT_LICENSES

RUN curl -O http://dl.google.com/android/android-sdk_r${SDK_VERSION}-linux.tgz && \
    tar -xvf android-sdk_r${SDK_VERSION}-linux.tgz && \
    rm -rf android-sdk_r${SDK_VERSION}-linux.tgz

WORKDIR android-sdk-linux

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

RUN ( while [ 1 ]; do sleep 5; echo ${ACCEPT_LICENSES}; done ) | android update sdk --no-ui
