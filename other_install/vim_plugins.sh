#! /bin/bash
sudo apt-get install build-essential cmake
./vundle.sh
vim +PluginInstall +qall
vim +GoInstallBinaries +qall
cd $HOME/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer
