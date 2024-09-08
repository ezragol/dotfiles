#!/bin/zsh

DEFAULT=$(pactl get-default-sink)

function get_current_vol {
    CURRENT_VOL=$(pactl get-sink-volume $DEFAULT | grep Volume | cut -d '/' -f2 | cut -d '%' -f1 | xargs)
}

get_current_vol

if [ "$CURRENT_VOL" -lt "200" ] ; then
    pactl set-sink-volume $DEFAULT +10%
    CURRENT_VOL=$((CURRENT_VOL+10))
else
    pactl set-sink-volume $DEFAULT 200%
fi

echo $CURRENT_VOL >> ~/.config/hypr/volume.txt