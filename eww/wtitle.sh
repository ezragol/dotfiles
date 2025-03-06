#!/bin/zsh

sleep 0.1

WORKSPACE=$(hyprctl activeworkspace -j | jq .id)

TITLE=$(hyprctl clients -j | jq -c ".[] | select(.workspace.id == $WORKSPACE) | .class" | jq -cs)

eww update wtitle="$(echo $TITLE | awk '{gsub(/\-/, "_"); print tolower($0)}')"