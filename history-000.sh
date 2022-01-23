#!/bin/bash
# 
# ----------------------------------------------------------------
# script:      history-000.sh
# title:       minos-one build system script #000
# description: Build linux from scratch with MD5 checksums. This
#              script is part of a larger collection of scripts.
#              It depends on the individual packages build
#              scripts located in sub-folders.
# author:      Joel Kraehemann
# date:        Sun Jan 23 15:10:54 UTC 2022
# ----------------------------------------------------------------

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

./gawk/build-000.sh
./checksum.sh

