#!/bin/bash

set -e
[[ -z $DEBUG ]] || set -x

# Install go font
echo "Installing go-font"
git clone https://go.googlesource.com/image /tmp/image-go-fonts
sudo cp /tmp/image-go-fonts/font/gofont/ttfs/Go-Mono* /usr/share/fonts/truetype/
