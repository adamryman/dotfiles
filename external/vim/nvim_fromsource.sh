#!/bin/bash
sudo apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
mkdir -p $HOME/external/neovim
(
	cd $HOME/external/neovim
	git clone https://github.com/neovim/neovim .
	make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/external/neovim/build"
	make install
)
mkdir -p $HOME/bin
ln -sf $HOME/external/neovim/build/bin/nvim $HOME/bin/nvim
ln -sf $HOME/external/neovim/build/bin/nvim $HOME/bin/vim
