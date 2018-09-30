#/usr/bin/env bash

echo "===== Replicating Folder Structure ====="
# Find all directories and make in $HOME. Directories cannot be symlinked from
# dotfiles as they won't always have all of the needed configs and I don't want
# to track everything in them nor maintain a .gitignore
(cd HOME && \
	find . \
	-type d \
	-exec test ! -d $HOME/'{}' \; \
	-and \
	-exec mkdir $HOME/'{}' \;
)

echo "===== Symlinking Files ====="
(cd HOME && \
	find . \
	-type f \
	-exec test ! -r $HOME/'{}' \; \
	-and \
	-exec ln -s `pwd`/'{}' $HOME/'{}' \;
)

set +x; source ~/.bashrc; set -x
