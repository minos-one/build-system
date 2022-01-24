#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/tar-1.34.tar.xz

cd tar-1.34


./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)


make
make DESTDIR=$LFS install
