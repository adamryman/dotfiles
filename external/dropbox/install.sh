#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

# cli
mkdir -p $HOME/external/dropbox
wget https://www.dropbox.com/download?dl=packages/dropbox.py > $HOME/external/dropbox/dropbox.py
ln -s $HOME/external/dropbox.py $HOME/bin/dropbox
ln -s $HOME/external/dropbox.py $HOME/bin/db


# download
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# start dropbox
~/.dropbox-dist/dropboxd

until $(dropbox exclude list | grep _large); do
	dropbox exclude '_large' 'Camera Uploads'
	sleep 1
done

ln -s $HOME/Dropbox $HOME/dropbox
ln -s $HOME/dropbox $HOME/dropbox/documents/vimwiki
ln -s $HOME/dropbox/documents $HOME/documents
ln -s $HOME/dropbox/documents/vimwiki $HOME/documents/vimwiki
