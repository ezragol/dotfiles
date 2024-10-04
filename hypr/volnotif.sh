#!/bin/zsh
CURRENT_VOL=$1
LAST=$(cat /home/ezra/.config/hypr/volid.txt)
VOLP=$((CURRENT_VOL / 2))

if [[ "$LAST" ]]; then
    echo $(notify-send -t 3000 -a "volume" -h string:syncronous:volume -h int:value:$VOLP "volume: $VOLP%" -p -r $LAST) > /home/ezra/.config/hypr/volid.txt
else
    echo $(notify-send -t 3000 -a "volume" -h string:syncronous:volume -h int:value:$VOLP "volume: $VOLP%" -p) > /home/ezra/.config/hypr/volid.txt
fi