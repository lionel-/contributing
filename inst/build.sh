#!/bin/bash


# R recommends setting this to avoid issues with programs like sed:
export LANG=C

export R_ARCH=""

# Get version in major.minor format:
VERSION=`sed 's/\([0-9]*.[0-9]*\).[0-9]*.*/\1/' ../VERSION`

# Use version-dev as default folder target:
TARGET=${1:-$VERSION-dev}


# Download recommended packages
../tools/rsync-recommended

../configure \
    --enable-R-framework FW_VERSION=${TARGET} \
    --with-aqua=yes \
    --with-x=yes \
    --enable-memory-profiling \
    CFLAGS="-g -O0" && \
  make all && \
  make install
