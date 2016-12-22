#! /bin/sh
export ARCH=arm
export NDK_ROOT=/opt/ndk/android-ndk-r13b
export ANDROID_SYSROOT=$NDK_ROOT/platforms/android-18/arch-arm
export PATH=$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$PATH
export INCLUDE_PATH="-I$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/lib/gcc/arm-linux-androideabi/4.9.x/include"
export LIB_PATH="-L$NDK_ROOT/platforms/android-16/arch-arm/usr/lib"
export AR="arm-linux-androideabi-ar rcu"
export AS=arm-linux-androideabi-as
export LD=arm-linux-androideabi-ld
export RANLIB=arm-linux-androideabi-ranlib
export CC="arm-linux-androideabi-gcc --sysroot=$ANDROID_SYSROOT "
export NM=arm-linux-androideabi-nm

