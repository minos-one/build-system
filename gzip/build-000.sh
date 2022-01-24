#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/gzip-1.10.tar.xz

cd gzip-1.10

./configure --prefix=/usr --host=$LFS_TGT

make
make DESTDIR=$LFS install
