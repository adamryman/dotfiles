#!/bin/bash
echo "enter sudo your password"
sudo echo "thanks"

# I will get to building webkit from source, looks hard so far.
# Build gtkwebkit from source
#sudo apt -y install bison gperf ilibcairo2-dev libgcrypt20-dev libgtk-3-dev
#mkdir -p $HOME/external/webkitgtk
#cd $HOME/external/webkitgtk
#wget https://webkitgtk.org/releases/webkitgtk-2.15.2.tar.xz
#tar -xzf webkitgtk-2.15.2.tar.xz
#cmake -DPORT=GTK -DCMAKE_BUILD_TYPE=RelWithDebInfo
#make -j`nproc`
#sudo make install

# Install gtkwebkit instead
sudo apt -y install libwebkitgtk-dev

mkdir -p $HOME/external/surf
cd $HOME/external/surf
git clone http://git.suckless.org/surf .

mkdir -p $HOME/.surf
ln -s $HOME/.surf/config.h $HOME/external/surf/config.h

make

ln -s $HOME/external/surf/surf $HOME/bin/surf
