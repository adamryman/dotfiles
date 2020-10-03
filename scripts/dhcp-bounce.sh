# base
# Use base tools for a bash script

# cross platform bash script start
#!/usr/bin/env bash

# Fail script and exit if any command exit's non-zero
set -e
# Add a DEBUG=* to the env and see all commands run. Useful for debugging
# DEBUG ./base
[[ -z $DEBUG ]] || set -x


sudo service network-manager stop
sudo service networking stop
sudo dhclient -r wlp2s0
sudo dhclient wlp2s0
sudo service networking start
sudo service network-manager start
