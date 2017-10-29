#!/bin/bash

set -e
[[ -z $DEBUG ]] || set -x

echo "sudo access required for giving user access to COM ports"
sudo echo "thanks"

VERSION=$(curl -s https://api.github.com/repos/arduino/Arduino/releases/latest | jq .tag_name | tr -d '"')

# If no version on github, then 1.8.5
if [[ -z $VERSION || $VERSION == "null" ]]; then
	VERSION="1.8.5"
fi

# Give user access to serial ports / COM ports
sudo usermod -a -G dialout $USER

mkdir -p $HOME/external
curl -s https://downloads.arduino.cc/arduino-${VERSION}-linux64.tar.xz | tar -v -C $HOME/external/ -J -xf -
ln -s $HOME/external/arduino-${VERSION}/arduino $HOME/bin/arduino

echo "logout may be required for access to com ports"
