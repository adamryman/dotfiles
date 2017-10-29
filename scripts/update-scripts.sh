#!/usr/bin/env bash
# Creates symlinks from:
# $HOME/dotfiles/scripts/*.sh -> $HOME/bin/scripts/*

set -e
[[ -z $DEBUG ]] || set -x

mkdir -p "$HOME/bin/scripts"
# Remove old scripts links (allows for renaming)
rm $HOME/bin/scripts/* | true
# Create new script links
for line in $(ls -d -1 $HOME/dotfiles/scripts/*.sh); do
	name=$(echo "$line" | rev | cut -c 4- | cut -d/ -f1 | rev);
	echo "$name"
	ln -sf "$line" "$HOME/bin/scripts/$name"
done
