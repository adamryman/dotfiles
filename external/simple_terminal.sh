#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x
echo "Please enter your password."
sudo echo "thanks"

echo "Installing dependencies"
sudo apt install -y x11proto-core-dev libx11-dev libxft-dev

(
echo "Cloning and building"
mkdir -p $HOME/external/st
cd $HOME/external/st
git clone http://git.suckless.org/st .
make

# config
echo "Linking config.h and st.1 (for config and docs)"
rm config.h
rm st.1
mkdir -p $HOME/.config/st
ln -s $HOME/.config/st/config.h $HOME/external/st/config.h
ln -s $HOME/.config/st/st.1 $HOME/external/st/st.1

echo "Rebuilding"
make

echo "Adding st to $HOME/bin"
mkdir -p $HOME/bin
ln -s $HOME/external/st/st $HOME/bin/st
)

echo "Done"
