#!/bin/bash

echo "minos-one build system"

./lfs-base/build-000.sh

# chapter 5
./binutils/build-000.sh
./checksum.sh

./gcc/build-000.sh
./checksum.sh

# linux headers
./linux/build-000.sh
./checksum.sh

./glibc/build-000.sh
./checksum.sh

./gcc/build-001.sh
./checksum.sh

# chapter 6
./m4/build-000.sh
./checksum.sh

./ncurses/build-000.sh
./checksum.sh

./bash/build-000.sh
./checksum.sh

./coreutils/build-000.sh
./checksum.sh

./diffutils/build-000.sh
./checksum.sh

./file/build-000.sh
./checksum.sh

./findutils/build-000.sh
./checksum.sh
