#!/bin/bash
sudo apt-get -y install libtool libtool-bin autoconf automake cmake g++
pkg-config unzip libunibilium-dev
mkdir -p $HOME/external/neovim
cd $HOME/external/neovim
git clone https://github.com/neovim/neovim .
# For whatever reason vim-go is not working on 0.2.0 or tip. This is the one
# @zaquestion uses
git checkout v0.1.6
mkdir build
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/external/neovim/build"
make install
mkdir -p $HOME/bin
ln -s $HOME/external/neovim/build/bin/nvim $HOME/bin/nvim
