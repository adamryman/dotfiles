# !/bin/bash

set -e
[[ -z $DEBUG ]] || set -x

# Install golang
curl https://dl.google.com`curl -s -L https://golang.org/dl | grep 'download downloadBox.\+linux-amd64' | cut -d'"' -f 4 | sed 's|dl|go|' ` > /tmp/golang.tar.gz
test -r /usr/local/go && sudo rm -rf /usr/local/go
sudo tar -C /usr/local/ -xzf /tmp/golang.tar.gz
