#!/bin/bash
# Usage: ./run.sh [-b]    -b = build & install, otherwise just run

BUILD=false
while getopts "b" opt; do
  case $opt in
    b) BUILD=true ;;
  esac
done

if $BUILD; then
  mkdir -p cmake_build
  cd cmake_build

  cmake .. -DSERVER_ONLY=ON

  if make -q; then
    echo "No changes detected, skipping build & install"
  else
    make -j$(nproc --ignore=1)
    sudo make install
  fi

  cd ..
fi

supertuxkart --server-config=config.xml --network-console