#!/bin/bash

export LFS="/mnt/sda1/home/h3lix/workspace/mnt"
export PATH=$LFS/tools/sbin:$LFS/tools/bin:/sbin:/usr/sbin:/bin:/usr/bin

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

ISO_DIR="/mnt/sda1/home/h3lix/workspace/iso"

mkdir -pv $ISO_DIR

cd /mnt/sda1/home/h3lix/workspace

dd status=progress bs=1M count=2048 if=/dev/zero of=$ISO_DIR/rootfs.iso
dd status=progress bs=1M count=4096 if=/dev/zero of=$ISO_DIR/modules.iso
dd status=progress bs=1M count=2048 if=/dev/zero of=$ISO_DIR/firmware.iso
dd status=progress bs=1M count=10240 if=/dev/zero of=$ISO_DIR/usr.iso
dd status=progress bs=1M count=8192 if=/dev/zero of=$ISO_DIR/opt.iso
dd status=progress bs=1M count=16384 if=/dev/zero of=$ISO_DIR/tools.iso
dd status=progress bs=1M count=131072 if=/dev/zero of=$ISO_DIR/build.iso

mkfs -v -t ext4 rootfs.iso
mkfs -v -t ext4 modules.iso
mkfs -v -t ext4 firmware.iso
mkfs -v -t ext4 usr.iso
mkfs -v -t ext4 opt.iso
mkfs -v -t ext4 tools.iso
mkfs -v -t ext4 build.iso

mkdir -pv $LFS

mount -o loop $ISO_DIR/rootfs.iso $LFS

mkdir -pv $LFS/lib/{firmware,modules}
mkdir -v $LFS/boot
mkdir -v $LFS/usr
mkdir -v $LFS/opt
mkdir -v $LFS/tools
mkdir -v $LFS/home

mount -o loop $ISO_DIR/boot.iso $LFS/boot
mount -o loop $ISO_DIR/firmware.iso $LFS/lib/firmware
mount -o loop $ISO_DIR/modules.iso $LFS/lib/modules
mount -o loop $ISO_DIR/usr.iso $LFS/usr
mount -o loop $ISO_DIR/opt.iso $LFS/opt
mount -o loop $ISO_DIR/tools.iso $LFS/tools

mkdir -pv $LFS/usr/src/{sources,build}

mount -o loop $ISO_DIR/sources.iso $LFS/usr/src/sources
mount -o loop $ISO_DIR/build.iso $LFS/usr/src/build

cd $LFS/usr/src/sources
curl -O https://www.linuxfromscratch.org/lfs/view/stable-systemd/wget-list
curl -O https://www.linuxfromscratch.org/lfs/view/stable-systemd/md5sums

mkdir -pv $LFS/{etc,var} $LFS/{bin,lib,lib64,sbin} $LFS/usr/{bin,lib,lib64,sbin}

groupadd h3lix
useradd -s /bin/bash -g h3lix -m -k /dev/null h3lix

chown -Rv h3lix $LFS/tools
chown -Rv h3lix $LFS/usr/src/build

su - h3lix

cp -v $SCRIPT_DIR/lfs-base/.bash_profile ~/
cp -v $SCRIPT_DIR/lfs-base/.bashrc ~/

source ~/.bash_profile

export MAKEFLAGS='-j8'

