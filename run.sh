#!/bin/bash
mkdir -p cmake_build
cd cmake_build
cmake .. -DSERVER_ONLY=ON

# only install if there are changes
if make -q; then
    echo "No changes detected, skipping installation"
else
    make -j$(nproc --ignore=1)
    sudo make install
fi

cd ..
supertuxkart --server-config=config.xml --network-console