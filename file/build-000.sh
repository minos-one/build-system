#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/file-5.40.tar.gz

cd file-5.40

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file
make DESTDIR=$LFS install
