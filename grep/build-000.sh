#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/grep-3.7.tar.xz

cd grep-3.7


./configure --prefix=/usr --host=$LFS_TGT

make
make DESTDIR=$LFS install
