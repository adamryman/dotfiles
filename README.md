# dotfiles - unity

This is an effort to make a core dotfiles for pair programming that is easy to install and remove. 

Additionally, being a 1 command install for nice simple dotfiles on a remote server.

Finally it is a hope to be a modular design for dotfiles, providing a stable shared core.

## Install

`$ ./install.sh` from within the dotfiles repository, a backup will be created in `./backup/EPOC_TIME`

`$ ./install.sh -f` will replace all files without prompt

`$ ./restore.sh EPOC_TIME` can be used with an `EPOC_TIME` in the backup directory

