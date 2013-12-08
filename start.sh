#!/bin/bash
set -o errexit
script_project="script2compile_nextvod"
kernel_project="kernel-pdk7105"
base_dir="/home/sh4twbox/ST_dev"
script_dir=$base_dir/$script_project
kernel_dir=$base_dir/$kernel_project
echo "1. Update script file"
echo "2. Compile kernel"
echo "3. Update kernel source code from github"
echo "4. Compile uboot"
echo "5. Update uboot soruce code from github"
echo "6. Clean code"
echo "7. Git Tool"
echo "9. Special system setup" 
read -p "Please input selection number:" select
case "$select" in
1)
  read -p "Press enter to update scropt file from https://github.com/rexct/$script_project" $go
  cd $script_dir
  git pull
  ;;
2)
  $script_dir/make_kernel.sh $kernel_dir
  ;;
3)
  echo "update kernel source:$kernel_project"
  if [ -d "$kernel_dir" ]; then
    cd $kernel_dir
    git pull
  else
    cd $base_dir
    git clone https://github.com/rexct/$kernel_project
  fi
  ;;
4)
  # compile uboot
  ;;
5)
  # update uboot source
  ;;
6)
  #clean code
  $script_dir/clean.sh $kernel_dir
  ;;
7)
  $script_dir/git_tools.sh $script_dir
  ;;
9)
  echo "No need to do now"
  ;;
*)
  echo "wrong selection"
  ;;
esac
echo "exit!!"
