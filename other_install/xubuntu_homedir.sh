#/bin/bash

rm -rf $HOME/*

ln -s $HOME/.dropbox/Dropbox $HOME/dropbox

mkdir -p $HOME/bin
mkdir -p $HOME/external

# xcwd
sudo apt install libx11-dev 
cd $HOME/external && git clone https://github.com/schischi/xcwd && cd xcwd && make && cp xcwd ../../bin

