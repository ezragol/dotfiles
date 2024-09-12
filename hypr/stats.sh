#!/bin/zsh

POS=$(hyprctl cursorpos | awk -F "," '{print $1 $2}')
X=$(echo $POS | awk '{print $1}')
Y=$(echo $POS | awk '{print $2}')

if [ "$X" -le "1075" ]; then
    eww update statsvisible=false
fi

if [ "$Y" -ge "365" ]; then
    eww update statsvisible=false
fi