#!/bin/bash
set -o errexit
cd $1
cd ..
base_dir=`pwd`
ls $base_dir
read -p "Set working directory: $base_dir/" dir1
cd $base_dir/$dir1
echo "Work at `pwd`"
echo "====================="
echo "1. set git user.name and user.email"
echo "2. git status"
echo "3. git add -i commit push"
echo "4. branch"
read -p "Please enter selection number:" select
case "$select" in
1)  # set git user.name and user.email
  echo "set user.name and user.email"
  read -p "user.name:" name
  read -p "user.email:" email
  git config --global user.name "$name"
  git config --global user.email "$email"
  sed -i "s,https://*github.com,https://$name@github.com,g" ./.git/config
  cat ./.git/config
;;

2)  # git status
  git status
;;

3)  # git add -i commit push
  git add -i
  read -p "Press Enter to add commit." conti
  git commit
  read -p "Press nter to push." conti
  git push
  echo "exit"
;;
4)  # branch
;;
*)
echo "Worng selection."
esac
