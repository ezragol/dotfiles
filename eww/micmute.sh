#!/bin/zsh

pactl set-source-mute @DEFAULT_SOURCE@ toggle
MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | cut -d ':' -f2)
echo $MUTED >> $HOME/.config/eww/micmute.txt
# CURRENT_VOL=$(pactl get-sink-volume @DEFAULT_SOURCE@ | grep Volume | cut -d '/' -f2 | cut -d '%' -f1 | xargs) 

LAST=$(cat $HOME/.config/eww/micid.txt)
VOLP=$((CURRENT_VOL / 2))
if [ "$MUTED" = " yes" ]; then 
    MUTE_T="muted"
else
    MUTE_T="unmuted"
fi

if [ $# -eq 0 ]; then
    if [[ "$LAST" ]]; then
        echo $(notify-send -t 3000 -a "[system notification]" -h string:syncronous:volume "microphone $MUTE_T" -p -r $LAST) > /home/ezra/.config/eww/micid.txt
    else
        echo $(notify-send -t 3000 -a "[system notification]" -h string:syncronous:volume "microphone $MUTE_T" -p) > /home/ezra/.config/eww/micid.txt
    fi
fi