#! /bin/bash
echo "enter sudo your password"
sudo echo "thanks"

# I know most systems will need some header files for X11 will add once I run
# this on a new computer
#sudo apt install -y

mkdir -p $HOME/external/st
cd $HOME/external/st
git clone http://git.suckless.org/st .

# config
mkdir -p $HOME/.config/st
ln -s $HOME/.config/st/config.h $HOME/external/st/config.h

make
ln -s $HOME/external/st/st $HOME/bin/st

echo "done"
