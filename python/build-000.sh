#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/Python-3.9.6.tar.xz

cd Python-3.9.6


./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make
make install

