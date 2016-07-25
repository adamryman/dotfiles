# dotfiles - unity

This is an effort to make a core dotfiles for pair programming that is easy to install and remove. 

Additionally, being a 1 command install for nice simple dotfiles on a remote server.

Finally it is a hope to be a modular design for dotfiles, providing a stable shared core.

## Install

`$ ./install.sh` from within the dotfiles repository, a backup will be created in ./backup/EPOC_TIME

`$ ./restore.sh EPOC_TIME` can be used with and EPOC_TIME in the backup directory

## Notes on modular design

Provide `$HOME/.before/` and `$HOME/.after/` directories where pre and post dotfiles can be placed.

Just add vundle to `.before/vimrc` and your custom bindings to `.after/vimrc`

TODO:

- Add checks in each dotfile for environment variables and source based on the outputs. Empty means no.

``` vim
" vimrc
if $UNITY_BEFORE
	source $HOME/.before/vimrc
endif
```

- Add prompts to install script providing options for amount of files to install
