#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

go build ./... 2>&1 | grep --line-buffered -v '#' | sed -u 's|:.*||' | head -n1 | xargs vim
