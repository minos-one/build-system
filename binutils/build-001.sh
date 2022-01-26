#!/bin/bash

cd $LFS/usr/src/build

rm -rf binutils-2.37
tar -xxf $LFS/usr/src/sources/binutils-2.37.tar.xz

cd binutils-2.37

mkdir -v build
cd       build

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd


make
make DESTDIR=$LFS install -j1
install -vm755 libctf/.libs/libctf.so.0.0.0 $LFS/usr/lib
