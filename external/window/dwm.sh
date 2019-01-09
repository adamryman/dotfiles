#!/usr/bin/env bash
set -e
[[ -z $DEBUG ]] || set -x

mkdir -p $HOME/external/dwm
(
	cd $HOME/external/dwm
	git clone http://git.suckless.org/dwm .
	ln $HOME/.config/dwm/config.h $HOME/external/dwm
	make
)

mkdir -p $HOME/bin
ln -s $HOME/external/dwm/dwm $HOME/bin/dwm
