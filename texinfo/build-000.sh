#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/texinfo-6.8.tar.xz

cd texinfo-6.8

sed -e 's/__attribute_nonnull__/__nonnull/' -i gnulib/lib/malloc/dynarray-skeleton.c

./configure --prefix=/usr

make
make install
