# !/bin/bash

set -e
[[ -z $DEBUG ]] || set -x

# nvim ppa
sudo apt install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

# neovim
sudo apt install -y python-dev python-pip python3-pip python3-dev neovim

# cli
sudo apt install -y git xfonts-terminus xclip tmux htop silversearcher-ag \
	cmake build-essential curl keychain graphviz cloc tree jq

# gui / X
sudo apt install -y xserver-xorg-core i3 keynav firefox \
	redshift scrot arandr cmake feh keepassx autocutsel

# python binding
pip2 install neovim
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

# downloads dir
mkdir -p $HOME/downloads
xdg-user-dirs-update --set DOWNLOAD $HOME/downloads

# Install go font
echo "Installing go-font"
git clone https://go.googlesource.com/image /tmp/image-go-fonts
sudo cp /tmp/image-go-fonts/font/gofont/ttfs/Go-Mono* /usr/share/fonts/truetype/

# Install golang
curl `curl -s -L https://golang.org/dl | grep 'download downloadBox.\+linux-amd64' | cut -d'"' -f 4` > /tmp/golang.tar.gz
test -r /usr/local/go && sudo rm -rf /usr/local/go
sudo tar -C /usr/local/ -xzf /tmp/golang.tar.gz

# Config Applications
echo "===== nvim Environment ====="
test ! -d ~/.vim/bundle/Vundle.vim && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
nvim +PluginInstall +GoInstallBinaries +qall && \
(cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --gocode-completer)

# Add stuff for github, dokku, and webserver ssh keys
