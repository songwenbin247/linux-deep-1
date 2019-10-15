#!/bin/bash

export ARCH=arm

export CROSS_COMPILE=/usr/local/arm/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin/arm-none-linux-gnueabi-

#make mrproper  # means CLEAN

make imx_v7_defconfig

if   [ "$1" = "nand" ]
then
	cp arch/arm/boot/dts/imx6ul-14x14-evk_nand.dts arch/arm/boot/dts/imx6ul-14x14-evk.dts
else
	cp arch/arm/boot/dts/imx6ul-14x14-evk_emmc.dts arch/arm/boot/dts/imx6ul-14x14-evk.dts
fi

make uImage LOADADDR=0x10008000 -j4

make imx6ul-14x14-evk.dtb
make imx6ul-14x14-evk_emmc.dtb
make imx6ul-14x14-evk_nand.dtb
