#!/bin/bash

cd $LFS/usr/src/build

tar -xxf $LFS/usr/src/sources/gettext-0.21.tar.xz

cd gettext-0.21

./configure --disable-shared

make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

