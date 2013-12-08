#!/bin/bash
cd kernel-pdk7105
prefix="make ARCH=sh CROSSCOMPILE=sh4-linux-"
clean="$prefix clean"
mrproper="$prefix mrproper"
echo "(1) Clean kernel source: $clean"
echo "(2) Clean Kernel source: $mrproper (for push to github)"
read -p "Please enter selection:" opt
case "$opt" in
  1)
    time $clean ;;
  2)
    time $mrproper ;;
  *)
    echo " Wrong selection!" ;;
esac
