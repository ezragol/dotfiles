#!/bin/zsh

DEFAULT=$(pactl get-default-sink)
VOLUME=$1
CURRENT_VOL=$((VOLUME * 2))

pactl set-sink-volume $DEFAULT $CURRENT_VOL%
echo $CURRENT_VOL >> ~/.config/hypr/volume.txt