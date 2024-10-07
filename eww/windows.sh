#!/bin/zsh

for WINDOW in $(hyprctl clients| grep Window | awk '{print $2}');
do
    hyprctl setprop address:0x$WINDOW alpha $1
    hyprctl setprop address:0x$WINDOW alphainactive $1
done