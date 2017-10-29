#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

# Quick note file
vim note.$(date +%s).md
