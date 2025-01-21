#!/bin/zsh

function get_current_vol {
    CURRENT_VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | cut -d '/' -f2 | cut -d '%' -f1 | xargs)
}

get_current_vol

if [ "$CURRENT_VOL" -lt "200" ] ; then
    pactl set-sink-volume @DEFAULT_SINK@ +10%
    CURRENT_VOL=$((CURRENT_VOL+10))
else
    pactl set-sink-volume @DEFAULT_SINK@ 200%
fi

if [ $# -eq 0 ]; then
    $HOME/.config/eww/volnotif.sh $CURRENT_VOL
fi

echo $CURRENT_VOL >> $HOME/.config/eww/volume.txt