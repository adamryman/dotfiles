# !/bin/bash

set -e
[[ -z $DEBUG ]] || set -x

# cli
sudo apt install -y git xfonts-terminus xclip tmux htop silversearcher-ag \
	cmake build-essential curl keychain graphviz cloc tree jq

# gui / X
sudo apt install -y xserver-xorg-core i3 keynav \
	redshift scrot arandr feh autocutsel xdotool

#git config --global user.email "adamryman@gmail.com"
git config --global user.name "Adam Ryman"

# downloads dir
mkdir -p $HOME/downloads
xdg-user-dirs-update --set DOWNLOAD $HOME/downloads

./go/golang.sh
./go/gofont.sh
./vim/nvim_fromsource.sh
./vim/nvim_env.sh
./terminal/simple_terminal.sh
./window/dwm.sh
