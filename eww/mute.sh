#!/bin/zsh

DEFAULT=$(pactl get-default-sink)
pactl set-sink-mute $DEFAULT toggle
echo $(pactl get-sink-mute $(pactl get-default-sink) | cut -d ':' -f2) >> $HOME/.config/eww/mute.txt

if [ $# -eq 0 ]; then
    /home/ezra/.config/eww/volnotif.sh
fi