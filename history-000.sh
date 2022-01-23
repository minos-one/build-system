#!/bin/bash

echo "minos-one build system"

./lfs-base/build-000.sh

# chapter 5
./binutils/build-000.sh
./gcc/build.sh

