#! /bin/bash
echo "enter sudo your password"
sudo echo "thanks"

mkdir -p $HOME/external/qutebrowser
sudo apt update
sudo apt install -y python3-pyqt5 python3-pyqt5.qtwebkit python3-pyqt5.qtquick \
	python-tox python3-sip python3-dev

# :help
sudo apt-get install asciidoc source-highlight

cd $HOME/external/qutebrowser
git clone https://github.com/The-Compiler/qutebrowser.git .
tox -e mkvenv

echo "#!/bin/bash" > $HOME/bin/qutebrowser
echo "$(pwd)/.venv/bin/python3 -m qutebrowser \$@" >> $HOME/bin/qutebrowser
chmod 755 $HOME/bin/qutebrowser
echo "done"
