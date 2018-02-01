# https://hub.docker.com/_/node/
FROM node:9.4.0

MAINTAINER Nils Poltmann <dev@nils.li>

# Fix node-sass error
# https://github.com/imagemin/imagemin/issues/168#issuecomment-265545957

RUN apt-get update && apt-get install -y \
  libpng-dev \
  autoconf \
  automake \
  make \
  g++ \
  libtool \
  nasm
