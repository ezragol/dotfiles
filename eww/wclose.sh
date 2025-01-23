#!/bin/zsh

WINDOW=$(hyprctl clients -j | jq -c '.[] | select(.class == "wofi") | .address' -r)

if [[ "$WINDOW" ]]; then
    hyprctl dispatch killwindow address:$WINDOW
fi

/home/ezra/.config/eww/windows.sh 1.0