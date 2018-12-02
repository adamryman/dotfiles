# base
# Use base tools for a bash script

# cross platform bash script start
#!/usr/bin/env bash

# Fail script and exit if any command exit's non-zero
set -e
# Add a DEBUG=* to the env and see all commands run. Useful for debugging
# DEBUG ./base
[[ -z $DEBUG ]] || set -x

$GOPATH/bin/gods &
exec dwm
