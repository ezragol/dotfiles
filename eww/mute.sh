#!/bin/zsh

pactl set-sink-mute @DEFAULT_SINK@ toggle
echo $(pactl get-sink-mute @DEFAULT_SINK@ | cut -d ':' -f2) >> $HOME/.config/eww/mute.txt
CURRENT_VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | cut -d '/' -f2 | cut -d '%' -f1 | xargs) 

if [ $# -eq 0 ]; then
    /home/ezra/.config/eww/volnotif.sh $CURRENT_VOL
fi