#!/usr/bin/env bash

# Fail script and exit if any command exit's non-zero.
set -e

# Add a DEBUG=1 to the env and see all commands run. Useful for debugging.
# DEBUG ./base
[[ -z $DEBUG ]] || set -x

