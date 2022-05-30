#!/usr/bin/env bash
set -ex

dotfiles_dir="$HOME/dotfiles/files"

pushd $dotfiles_dir
files=$(for f in $(echo .*); do echo $f; done | grep -v -e '^.$' -e '^..$')
popd

for fname in $files; do
    echo "Linking $fname"
    ln -s -f "$dotfiles_dir/$fname" "$HOME/$fname"
done


