#!/bin/zsh
CURRENT_VOL=$1
LAST=$(cat /home/ezra/.config/hypr/volid.txt)

if [[ "$LAST" ]]; then
    echo $(notify-send -t 3000 -a "volume" -h string:syncronous:volume -h int:value:$((CURRENT_VOL / 2)) " " -p -i /home/ezra/.config/hypr/images/volume_high.png -r $LAST) > /home/ezra/.config/hypr/volid.txt
else
    echo $(notify-send -t 3000 -a "volume" -h string:syncronous:volume -h int:value:$((CURRENT_VOL / 2)) " " -p -i /home/ezra/.config/hypr/images/volume_high.png) > /home/ezra/.config/hypr/volid.txt
fi