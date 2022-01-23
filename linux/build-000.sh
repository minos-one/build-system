#!/bin/bash

cd $LFS/usr/src/build
tar -xxf $LFS/usr/src/sources/linux-5.13.12.tar.xz

cd linux-5.13.12

make mrproper

make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr
