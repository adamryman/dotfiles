# !/bin/bash

set -e
[[ -z $DEBUG ]] || set -x

./dev.sh

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
