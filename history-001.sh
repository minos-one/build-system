#!/bin/bash
# 
# ----------------------------------------------------------------
# script:      history-001.sh
# title:       minos-one build system script #001
# description: Build linux from scratch with MD5 checksums. This
#              script is part of a larger collection of scripts.
#              It depends on the individual packages build
#              scripts located in sub-folders.
# author:      Joel Kraehemann
# date:        Wed Jan 26 11:58:25 UTC 2022
# ----------------------------------------------------------------

./gcc/build-003.sh
./checksum.sh

./gettext/build-000.sh
./checksum.sh

./bison/build-000.sh
./checksum.sh

./perl/build-000.sh
./checksum.sh

./python/build-000.sh
./checksum.sh

./texinfo/build-000.sh
./checksum.sh
