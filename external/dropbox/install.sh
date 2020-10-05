#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

# cli
mkdir -p $HOME/external/dropbox
wget -O $HOME/external/dropbox/dropbox.py 'https://www.dropbox.com/download?dl=packages/dropbox.py' 
chmod +x $HOME/external/dropbox/dropbox.py
ln -s $HOME/external/dropbox/dropbox.py $HOME/bin/dropbox
ln -s $HOME/external/dropbox/dropbox.py $HOME/bin/db

./exclude.sh &

# download
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# start dropbox
db start

# link
ln -s $HOME/Dropbox $HOME/dropbox
ln -s $HOME/dropbox/documents $HOME/documents
ln -s $HOME/dropbox/documents/vimwiki $HOME/vimwiki



