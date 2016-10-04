#! /bin/bash
mkdir -p $HOME/.vim/bundle/ && \
	cd $HOME/.vim/bundle/  && \
git clone --depth 1 https://github.com/gmarik/Vundle.vim.git 
