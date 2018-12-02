# !/bin/bash

set -e
[[ -z $DEBUG ]] || set -x

echo "===== nvim Environment ====="
test ! -d ~/.vim/bundle/Vundle.vim && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
nvim +PluginInstall +GoInstallBinaries +qall && \
(cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --gocode-completer)
