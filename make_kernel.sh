#!/bin/bash
set -o errexit
cpu=`grep processor  /proc/cpuinfo |wc -l`
echo "Use $cpu cpu(s).  script:rexct"
kernel_dir="kernel-pdk7105"
script_dir="script2compile_nexvod"

cd ..

cd $kernel_dir
echo "Kerel source at `pwd`"
cp -i ../$script_dir/kernel.config .config

read -p "Prass Enter to config." conti
time make ARCH=sh CROSS_COMPILE=sh4-linux- menuconfig

read -p "Press Enter to compile vmlinux:" conti
time make ARCH=sh CROSS_COMPILE=sh4-linux- CFLAGS="-m4a -pipe -O3 -ffast-math" -j $cpu vmlinux

read -p "Press Enter to compress vmlinux.ub:" conti
time env PATH="/opt/STM/STLinux-2.4/host/bin:"$PATH ./autoDone.sh

read -p "Press Enter to compile modules:" conti
time make ARCH=sh CROSS_COMPILE=sh4-linux- CFLAGS="-m4a -pipe -O3 -ffast-math" -j $cpu modules

read -p "Press Enter to install modules to /home/sh4twbox/ST_dev:" conti
time make ARCH=sh CROSS_COMPILE=sh4-linux- -j $cpu INSTALL_MOD_PATH=/home/sh4twbox/ST_dev modules_install

read -p "Press Enter to install Headers to /home/sh4twbox/ST_dev:" conti
time make ARCH=sh CROSS_COMPILE=sh4-linux- -j $cpu INSTALL_HDR_PATH=/home/sh4twbox/ST_dev headers_install

