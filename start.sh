#!/bin/bash
set -o errexit
script_project="script2compile_nextvod"
base_dir=`pwd`
script_dir=$base_dir/$script_project
kernel_dir=$base_dir/"kernel-pdk7105"
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
  git clone https://github.com/rexct/$script_project
  ;;
2)
  $script_dir/make_kernel.sh $kernel_dir
  ;;
3)
  echo "update kernel source:$kernel_dir"
  git clone https://github.com/rexct/$kernel_dir
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
