#!/bin/zsh

DEFAULT=$(pactl get-default-sink)
pactl set-sink-mute $DEFAULT toggle
echo $(pactl get-sink-mute $(pactl get-default-sink) | cut -d ':' -f2) >> $HOME/.config/eww/mute.txt