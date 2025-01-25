#!/bin/zsh

ADDR=$(hyprctl clients -j | jq --arg CLASS "$1" -c '.[] | select(.class == $CLASS) | .address' -r)

if [[ "$ADDR" ]]; then
    /home/ezra/.config/eww/windows.sh 0.1 $ADDR
    hyprctl keyword bindn , Escape, exec, /home/ezra/.config/eww/wclose.sh
fi