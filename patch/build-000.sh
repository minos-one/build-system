#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/patch-2.7.6.tar.xz 

cd patch-2.7.6


./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)


make
make DESTDIR=$LFS install
