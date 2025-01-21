#!/bin/zsh

pactl set-sink-volume @DEFAULT_SINK@ -10%
CURRENT_VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | cut -d '/' -f2 | cut -d '%' -f1 | xargs) 

if [ $# -eq 0 ]; then
    $HOME/.config/eww/volnotif.sh $CURRENT_VOL
fi
echo $CURRENT_VOL >> $HOME/.config/eww/volume.txt