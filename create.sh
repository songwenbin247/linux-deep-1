#!/bin/bash

export ARCH=arm

export CROSS_COMPILE=/usr/local/arm/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin/arm-none-linux-gnueabi-

#make mrproper  # means CLEAN

make imx_v7_defconfig

make uImage LOADADDR=0x10008000

make imx6ul-14x14-evk.dtb
