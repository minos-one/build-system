#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/bison-3.7.6.tar.xz

cd bison-3.7.6


./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.7.6

make
make install

