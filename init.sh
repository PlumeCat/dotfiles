#!/usr/bin/env bash
set -ex

user=$(whoami)
dotfiles_dir="/home/$user/dotfiles/files"

pushd $dotfiles_dir
files=$(for f in $(echo .*); do echo $f; done | grep -v -e '^.$' -e '^..$')
popd

for fname in $files; do
    ln -s $dotfiles_dir/$fname /home/$user/$fname
done


