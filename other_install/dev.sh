# !/bin/bash

# nvim ppa
sudo apt install software-properties-common 
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

# neovim 
sudo apt install -y python-dev python-pip python3-pip python3-dev neovim

# cli
sudo apt install -y git xfonts-terminus xclip tmux htop silversearcher-ag \
	cmake build-essential curl keychain

# gui / X
sudo apt install -y xserver-xorg-core i3 keynav firefox \
	redshift scrot arandr cmake feh keepassx autocutsel

# python binding
pip3 install neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

sudo update-alternatives --config vi
sudo update-alternatives --config vim
sudo update-alternatives --config editor

# Needed for urxvt copy and url select
# TODO switch all uses to xclip
sudo apt install -y xsel

#git config --global user.email "adamryman@gmail.com"
git config --global user.name "Adam Ryman"

