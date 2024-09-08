#!/bin/zsh

BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
BRIGHTNESS=$((BRIGHTNESS+9600))

if [ "$BRIGHTNESS" -le "96000" ] ; then
	echo $BRIGHTNESS > /sys/class/backlight/intel_backlight/brightness
else
	echo 96000 > /sys/class/backlight/intel_backlight/brightness
fi
