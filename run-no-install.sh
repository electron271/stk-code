#!/bin/bash
mkdir -p cmake_build
cd cmake_build
cmake .. -DSERVER_ONLY=ON

# only build if there are changes
if make -q; then
    echo "No changes detected, skipping build"
else
    make -j$(nproc --ignore=1)
fi

cd bin
./supertuxkart --server-config=../../config.xml --network-console