#!/bin/zsh

TITLE="$(hyprctl activewindow -j | jq ".class" -r)"

if [ "$TITLE" = "wofi" ]; then
    TITLE="app_explorer"
fi

eww update wtitle="$(echo $TITLE | awk '{gsub(/\-/, "_"); print tolower($0)}')"