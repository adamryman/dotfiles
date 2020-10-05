# !/bin/bash

set -e
[[ -z $DEBUG ]] || set -x

# cli
sudo apt install -y xfonts-terminus xclip tmux htop silversearcher-ag \
	cmake build-essential curl keychain graphviz cloc tree jq

# gui / X
sudo apt install -y xserver-xorg-core i3 keynav \
	redshift scrot arandr feh autocutsel xdotool xinit
