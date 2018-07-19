# https://hub.docker.com/_/node/
FROM node:10.6.0-alpine

MAINTAINER Nils Poltmann <dev@nils.li>

# Fix node-sass error
# https://github.com/imagemin/imagemin/issues/168#issuecomment-265545957

RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
  libpng-dev \
  autoconf \
  automake \
  make \
  g++ \
  libtool \
  nasm \
  ca-certificates \
  python2 \
  python2-dev \
  py-setuptools \
  bash \
  rsync \
  openssh \
  bash \
  ca-certificates \
  zip \
  unzip \
  openssh-client \
 && rm -rf /var/cache/apk/*

# http://sharp.pixelplumbing.com/en/stable/install/
RUN apk add \
  vips-dev \
  fftw-dev \
  --no-cache --repository https://dl-3.alpinelinux.org/alpine/edge/testing/ \
 && rm -rf /var/cache/apk/*

# From: https://github.com/jfloff/alpine-python/
RUN echo \
  # make some useful symlinks that are expected to exist
  && if [[ ! -e /usr/bin/python ]];        then ln -sf /usr/bin/python2.7 /usr/bin/python; fi \
  && if [[ ! -e /usr/bin/python-config ]]; then ln -sf /usr/bin/python2.7-config /usr/bin/python-config; fi \
  && if [[ ! -e /usr/bin/easy_install ]];  then ln -sf /usr/bin/easy_install-2.7 /usr/bin/easy_install; fi \

  # Install and upgrade Pip
  && easy_install pip \
  && pip install --upgrade pip \
  && if [[ ! -e /usr/bin/pip ]]; then ln -sf /usr/bin/pip2.7 /usr/bin/pip; fi
