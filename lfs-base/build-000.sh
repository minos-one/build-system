#!/bin/bash

export LFS="/mnt/sda1/home/h3lix/workspace/mnt"

mkdir -pv $LFS
mkdir -v $LFS/tools
mkdir -v $LFS/home
mkdir -pv $LFS/usr/src/{sources,build}

cd $LFS/usr/src/sources
curl -O https://www.linuxfromscratch.org/lfs/view/stable-systemd/wget-list
curl -O https://www.linuxfromscratch.org/lfs/view/stable-systemd/md5sums

mkdir -pv $LFS/{etc,var} $LFS/{bin,lib,sbin} $LFS/usr/{bin,lib,sbin}

if [ "$(uname -m)" == "x86_64" ]; then
    cd $LFS
    ln -sv lib lib64

    cd $LFS/usr
    ln -sv lib lib64
fi

groupadd h3lix
useradd -s /bin/bash -g h3lix -m -k /dev/null h3lix

chown -Rv h3lix $LFS/tools
chown -Rv h3lix $LFS/usr/src/build

su - h3lix

cp -v /mnt/sda1/home/h3lix/workspace/rbuilds/lfs-base/.bash_profile ~/
cp -v /mnt/sda1/home/h3lix/workspace/rbuilds/lfs-base/.bashrc ~/

source ~/.bash_profile

export MAKEFLAGS='-j8'

