+++
date = "2015-11-02T02:49:05+02:00"
draft = false
title = "Two ways to setup all Python versions in Docker image"

+++

I'm using Travis CI to run `pywinrm` tests for different Python versions but only Python 2.7 is used for development at my workstation.

It would be nice if all those tests could be executed locally by me or by contributors, so I did some analysis and sharing my results here.

Eventually it would be simple command like `make.sh test` that will build Docker image and run all tests.

In most cases I'm prefer to use `debian:jessie` because it's a base for a majority of official images; but here I will go with Ubuntu image.

## Precompiled packages from Deadsnakes Ubuntu PPA

Image virtual size is 327 MB

```Dockerfile
FROM ubuntu:14.04
MAINTAINER Alexey Diyan <alexey.diyan@gmail.com>

RUN set -x \
    && pythonVersions='python2.6 python2.7 python3.1 python3.2 python3.3 python3.4 python3.5' \
    && apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && apt-add-repository -y ppa:fkrull/deadsnakes \
    && apt-get update \
    && apt-get install -y --no-install-recommends $pythonVersions \
    && apt-get purge -y --auto-remove software-properties-common \
    && rm -rf /var/lib/apt/lists/*

CMD bash
```

## Compile from source using pyenv tool

Image virtual size is 1.034 GB

```Dockerfile
FROM debian:jessie
MAINTAINER Alexey Diyan <alexey.diyan@gmail.com>

ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:$PATH
RUN set -x \
    && pythonVersions='2.6.9 2.7.10 3.1.5 3.2.6 3.3.6 3.4.3 3.5.0' \
    && buildDeps='ca-certificates curl git libjpeg-dev build-essential make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev' \
    && apt-get update \
    && apt-get install --no-install-recommends -y $buildDeps \
    && curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash \
    && echo $pythonVersions | xargs -n 1 pyenv install \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/*

CMD bash

```

## In addition..

Also, I have tried to build image based on `alpine:3.2`, just for fun.

Compilation did work for Python versions 2.7.10, 3.3.6, 3.4.3, 3.5.0 which is good.

Unfortunately, I have not managed to build following versions - 2.6.9, 3.1.5, 3.2.6; compilation was failed for both GCC and Clang compilers.


