#!/bin/zsh

STATUS=$(eww get statsvisible)

if [ "$STATUS" = "true" ]; then
    eww update statsvisible=false
    exec /home/ezra/.config/hypr/windows.sh 1.0 &
    eww close stats
else
    eww open stats
    exec /home/ezra/.config/hypr/windows.sh 0.0 &
    eww update statsvisible=true
fi