#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/make-4.3.tar.gz 

cd make-4.3

./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install
