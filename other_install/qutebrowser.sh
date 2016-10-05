#! /bin/bash

mkdir -p $HOME/external/qutebrowser
cd $HOME/external/qutebrowser
wget https://github.com/The-Compiler/qutebrowser/releases/download/v0.8.2/qutebrowser_0.8.2-1_all.deb
wget https://qutebrowser.org/python3-pypeg2_2.15.2-1_all.deb
sudo apt install -u python3-lxml python-tox python3-pyqt5 python3-pyqt5.qtwebkit python3-sip python3-jinja2 python3-pygments python3-yaml
sudo dpkg -i python3-pypeg2_2.15.2-1_all.deb 
sudo dpkg -i qutebrowser_0.8.2-1_all.deb 
