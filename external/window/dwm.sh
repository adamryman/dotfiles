#!/usr/bin/env bash
set -e
[[ -z $DEBUG ]] || set -x

mkdir -p $HOME/external/dwm
(
cd $HOME/external/dwm
git clone http://git.suckless.org/dwm .
cp $HOME/dotfiles/HOME/.config/dwm/config.h .
make
)

mkdir -p $HOME/bin
ln -s $HOME/external/dwm/dwm $HOME/bin/dwm
