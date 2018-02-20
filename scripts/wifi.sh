#!/usr/bin/env bash
# wifi.sh connects wifi SSID $1

set -e
[[ -z $DEBUG ]] || set -x

SSID="$1"

# -z string
# True if the length of string is zero.
if [[ -z "$SSID" ]]; then
	echo "Usage: $(basename $0) SSID";
	echo "connects to SSID using connmanctl";
	exit 1;
fi

set -x
sudo service networking restart
sleep 1
sudo service connman restart
sleep 1
sudo connmanctl disable wifi
sleep 1
sudo connmanctl enable wifi
sleep 1
sudo connmanctl scan wifi

service="$(sudo connmanctl services | grep "$1" | head -1 | sed "s|.*wifi|wifi|")"
echo
echo $SSID found
echo

sudo connmanctl connect $service
