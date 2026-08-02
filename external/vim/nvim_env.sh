# !/bin/bash

set -e
[[ -z $DEBUG ]] || set -x

echo "===== nvim Environment ====="
mkdir -p $HOME/.config/nvim/autoload
curl -q https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > $HOME/.config/nvim/autoload/plug.vim
#test ! -d ~/.vim/bundle/Vundle.vim && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
#nvim +PluginInstall +GoInstallBinaries +qall && \
#(cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --gocode-completer)
