#!/bin/zsh

# $HOME/.config/eww/ctx.sh hide
WORKSPACE=$(hyprctl clients -j | jq --arg CLASS "$1" -c '.[] | select(.class == $CLASS) | .workspace.id' -r)

echo $WORKSPACE

if [[ "$WORKSPACE" ]]; then
    hyprctl dispatch workspace $WORKSPACE
    exit
fi

${@:2}