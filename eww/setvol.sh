#!/bin/zsh

VOLUME=$1
CURRENT_VOL=$((VOLUME * 2))

pactl set-sink-volume @DEFAULT_SINK@ $CURRENT_VOL%
echo $CURRENT_VOL >> $HOME/.config/eww/volume.txt