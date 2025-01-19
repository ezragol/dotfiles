#!/bin/zsh
CURRENT_VOL=$1
LAST=$(cat $HOME/.config/eww/volid.txt)
VOLP=$((CURRENT_VOL / 2))
MUTED=$(pactl get-sink-mute $(pactl get-default-sink) | cut -d ':' -f2)
if [ "$MUTED" = " yes" ]; then 
    MUTE_T="(muted)"
else
    MUTE_T=""
fi

if [[ "$LAST" ]]; then
    echo $(notify-send -t 3000 -a "[system notification]" -h string:syncronous:volume -h int:value:$VOLP "volume: $VOLP% $MUTE_T" -p -r $LAST) > /home/ezra/.config/eww/volid.txt
else
    echo $(notify-send -t 3000 -a "[system notification]" -h string:syncronous:volume -h int:value:$VOLP "volume: $VOLP% $MUTE_T" -p) > /home/ezra/.config/eww/volid.txt
fi