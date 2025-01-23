#!/bin/zsh

WORKSPACE=$(hyprctl activeworkspace -j | jq .id)

for WINDOW in $(hyprctl clients -j | jq -c ".[] | select(.workspace.id == $WORKSPACE) | .address" -r);
do
    if [ "$WINDOW" != "$2" ]; then
        hyprctl dispatch setprop address:$WINDOW alpha $1
        hyprctl dispatch setprop address:$WINDOW alphainactive $1
    fi
done