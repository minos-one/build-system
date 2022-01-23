#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/findutils-4.8.0.tar.xz

cd findutils-4.8.0


./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install
