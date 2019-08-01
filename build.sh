#!/bin/bash
# EMC2 build script for Ubuntu & Debian 9 v.3 (c) Decker (and webworker)
# modified for CHIPS by Duke Leto + radix42

    CHIPS_ROOT=$(pwd)
#    git pull
    make clean
    cd depends
    make NO_QT=1
    cd ..
    ./autogen.sh
CONFIG_SITE="$PWD/depends/x86_64-pc-linux-gnu/share/config.site"    ./configure LDFLAGS="-L${CHIPS_ROOT}/depends/x86_64-pc-linux-gnu/lib" CPPFLAGS="-I${CHIPS_ROOT}/depends/x86_64-pc-linux-gnu//include" --with-gui=no --disable-tests --disable-bench --without-miniupnpc --enable-experimental-asm --enable-static --disable-shared --with-boost-libdir=$(pwd)/depends/x86_64-pc-linux-gnu/lib 
    make V=1 #  -j$(nproc)

