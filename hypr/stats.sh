#!/bin/zsh

POS=$(hyprctl cursorpos | awk -F "," '{print $1 $2}')
X=$(echo $POS | awk '{print $1}')
Y=$(echo $POS | awk '{print $2}')

if [ "$X" -le "1373" ]; then
    # eww update statsvisible=false
fi

if [ "$Y" -ge "410" ]; then
    # eww update statsvisible=false
fi