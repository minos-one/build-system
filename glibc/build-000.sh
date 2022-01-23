#!/bin/bash

cd $LFS/usr/src/build
tar -xxf $LFS/usr/src/sources/glibc-2.34.tar.xz

cd glibc-2.34

if [ "$(uname -m)" == "x86_64" ]; then
    ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
elif [ "$(uname -m)" == "i386" || "$(uname -m)" == "i386" || "$(uname -m)" == "i586" || "$(uname -m)" == "i686" ]; then
    ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
fi

patch -Np1 -i $LFS/usr/src/sources//glibc-2.34-fhs-1.patch

mkdir -v build
cd       build

echo "rootsbindir=/usr/sbin" > configparms

../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/usr/lib

make

make DESTDIR=$LFS install

sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd

echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep '/ld-linux'

rm -v dummy.c a.out

$LFS/tools/libexec/gcc/$LFS_TGT/11.2.0/install-tools/mkheaders

