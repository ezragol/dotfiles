#!/bin/zsh

BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
BRIGHTNESS=$((BRIGHTNESS-9600))

if [ "$BRIGHTNESS" -ge "0" ] ; then
	echo $BRIGHTNESS > /sys/class/backlight/intel_backlight/brightness
else
	echo 0 > /sys/class/backlight/intel_backlight/brightness
fi
