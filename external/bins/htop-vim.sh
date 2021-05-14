#!/usr/bin/env bash

# Fail script and exit if any command exit's non-zero
set -e
# Add a DEBUG=* to the env and see all commands run. Useful for debugging
[[ -z $DEBUG ]] || set -x

if [[ -f "$HOME/bin/htop" ]]; then
	echo "htop exists in bin, aborting";
	exit 0;
fi

echo "Install required deps"
sudo apt-get install -y libncursesw5-dev

mkdir -p $HOME/external
cd $HOME/external
git clone https://github.com/KoffeinFlummi/htop-vim
cd htop-vim
./autogen.sh && ./configure && make

mkdir -p $HOME/bin
ln -s $HOME/external/htop-vim/htop $HOME/bin/htop
echo done
