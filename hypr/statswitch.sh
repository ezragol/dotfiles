#!/bin/zsh

STATUS=$(eww get statsvisible)

if [ "$STATUS" = "true" ]; then
    hyprctl dispatch togglespecialworkspace stats
    eww update statsvisible=false
else
    hyprctl dispatch togglespecialworkspace stats
    eww update statsvisible=true
fi