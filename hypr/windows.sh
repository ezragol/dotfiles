#!/bin/zsh

WORKSPACE=$(hyprctl activeworkspace | awk 'NR==1{print $3}')

for WINDOW in $(hyprctl clients | awk -v RS= -v ORS='\n\n' "/workspace: $WORKSPACE/ {print $i}" | grep Window | awk '{print $2}');
do
    hyprctl setprop address:0x$WINDOW alpha $1
    hyprctl setprop address:0x$WINDOW alphainactive $1
done