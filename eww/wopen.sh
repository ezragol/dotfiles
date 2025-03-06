#!/bin/zsh

# only runs when wofi is opened

ADDR=$(hyprctl clients -j | jq --arg CLASS "$1" -c '.[] | select(.class == $CLASS) | .address' -r)

echo $ADDR

hyprctl clients -j | jq --arg CLASS "$1" --arg ADDR "$ADDR" '.[] | select(.class == $CLASS) | select(.address != $ADDR) | .pid' | xargs kill

if [[ "$ADDR" ]]; then
    /home/ezra/.config/eww/windows.sh 0.3 $ADDR
    hyprctl keyword bindn , Escape, exec, /home/ezra/.config/eww/wclose.sh
fi