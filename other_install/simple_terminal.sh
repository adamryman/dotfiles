#! /bin/bash
echo "enter sudo your password"
sudo echo "thanks"

sudo apt install -y x11proto-core-dev libx11-dev libxft-dev

mkdir -p $HOME/external/st
cd $HOME/external/st
git clone http://git.suckless.org/st .
make

# config
rm config.h
mkdir -p $HOME/.config/st
ln -s $HOME/.config/st/config.h $HOME/external/st/config.h

make
ln -s $HOME/external/st/st $HOME/bin/st

echo "done"
