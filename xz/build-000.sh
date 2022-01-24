#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/xz-5.2.5.tar.xz

cd xz-5.2.5


./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.5

make
make DESTDIR=$LFS install
