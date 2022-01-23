#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/diffutils-3.8.tar.xz

cd diffutils-3.8

./configure --prefix=/usr --host=$LFS_TGT

make
make DESTDIR=$LFS install
