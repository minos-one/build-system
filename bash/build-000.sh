#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/bash-5.1.8.tar.gz

cd bash-5.1.8

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc

make
make DESTDIR=$LFS install

ln -sv bash $LFS/bin/sh
