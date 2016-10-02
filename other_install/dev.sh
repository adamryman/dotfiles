# !/bin/bash

# nvim ppa
sudo apt install software-properties-common 
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

sudo apt install git i3 xfonts-terminus rxvt-unicode-256color keynav xclip python-dev python-pip python3-pip python3-dev neovim firefox tmux htop redshift

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

sudo update-alternatives --config vi
sudo update-alternatives --config vim
sudo update-alternatives --config editor
