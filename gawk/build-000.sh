#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/gawk-5.1.0.tar.xz

cd gawk-5.1.0

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./config.guess)

make
make DESTDIR=$LFS install

