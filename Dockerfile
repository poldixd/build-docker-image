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
 && rm -rf /var/cache/apk/*
