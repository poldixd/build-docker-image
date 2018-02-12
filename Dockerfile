# https://hub.docker.com/_/node/
FROM node:9.5.0-alpine

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
  python3 \
  python3-dev \
 && rm -rf /var/cache/apk/*

# From: https://github.com/jfloff/alpine-python/
RUN echo \
  # make some useful symlinks that are expected to exist
  && if [[ ! -e /usr/bin/python ]];        then ln -sf /usr/bin/python3 /usr/bin/python; fi \
  && if [[ ! -e /usr/bin/python-config ]]; then ln -sf /usr/bin/python3-config /usr/bin/python-config; fi \
  && if [[ ! -e /usr/bin/pydoc ]];         then ln -sf /usr/bin/pydoc3 /usr/bin/pydoc; fi \
  && if [[ ! -e /usr/bin/easy_install ]];  then ln -sf $(ls /usr/bin/easy_install*) /usr/bin/easy_install; fi \

  # Install and upgrade Pip
  && easy_install pip \
  && pip install --upgrade pip \
  && if [[ ! -e /usr/bin/pip ]]; then ln -sf /usr/bin/pip3 /usr/bin/pip; fi
