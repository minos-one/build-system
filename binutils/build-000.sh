#!/bin/bash

cd $LFS/usr/src/build
tar -xxf $LFS/usr/src/sources/binutils-2.37.tar.xz

cd binutils-2.37
mkdir -v build
cd       build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --disable-werror

make
make install -j1
