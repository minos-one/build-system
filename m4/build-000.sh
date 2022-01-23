#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/m4-1.4.19.tar.xz

cd m4-1.4.19

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install
