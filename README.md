# poldixd/build

This Image extends [node:x-alpine](https://hub.docker.com/_/node/). The original node image can't compile important libs from [imagemin/imagemin](https://github.com/imagemin/imagemin), a webpack loader.

The solution is to install following packages:

- libpng-dev
- autoconf
- automake
- make
- g++
- libtool
- nasm

Here is the original issue [#168](https://github.com/imagemin/imagemin/issues/168#issuecomment-265545957) on imagemin/imagemin.

## Docker Hub

You can find this image on [Docker Hub](https://hub.docker.com/r/poldixd/build/).
