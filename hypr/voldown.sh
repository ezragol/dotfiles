#!/bin/zsh

DEFAULT=$(pactl get-default-sink)
pactl set-sink-volume $DEFAULT -10%
echo $(pactl get-sink-volume $DEFAULT | grep Volume | cut -d '/' -f2 | cut -d '%' -f1) >> ~/.config/hypr/volume.txt