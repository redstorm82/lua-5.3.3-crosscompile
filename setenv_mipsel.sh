#! /bin/sh
export ARCH=mipsel
export MIPSELGCCROOT=/opt/buildroot-gcc463
export PATH=$PATH:$MIPSELGCCROOT/usr/bin
export INCLUDE_PATH=-I$MIPSELGCCROOT/usr/include
export LIB_PATH=
export AR="mipsel-linux-ar rcu"
export AS=mipsel-linux-as
export LD=mipsel-linux-ld
export RANLIB=mipsel-linux-ranlib
export CC=mipsel-linux-gcc
export NM=mipsel-linux-nm

