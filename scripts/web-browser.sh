#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

# Default chrome but nice, lower priority than all other processes
nice -n 10 /usr/bin/google-chrome
