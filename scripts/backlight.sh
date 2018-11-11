#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

brightness_percentage="1"
if [[ -n $1 ]]; then
	brightness_percentage="$1"
fi

sudo echo "updating brightness file"
sudo tee /sys/class/backlight/intel_backlight/brightness <<< \
	$(echo "$brightness_percentage * $(cat /sys/class/backlight/intel_backlight/max_brightness) / 1" | bc);
xrandr --output eDP-1 --brightness $brightness_percentage
