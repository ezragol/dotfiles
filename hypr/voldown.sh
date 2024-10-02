#!/bin/zsh

DEFAULT=$(pactl get-default-sink)
pactl set-sink-volume $DEFAULT -10%
CURRENT_VOL=$(pactl get-sink-volume $DEFAULT | grep Volume | cut -d '/' -f2 | cut -d '%' -f1 | xargs) 

/home/ezra/.config/hypr/volnotif.sh $CURRENT_VOL
echo $CURRENT_VOL >> ~/.config/hypr/volume.txt