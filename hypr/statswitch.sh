#!/bin/zsh

STATUS=$(eww get statsvisible)

if [ "$STATUS" = "true" ]; then
    NEOWINDOW=$(hyprctl clients | awk -v RS= -v ORS='\n\n' "/class: neo/ {print $i}" | grep pid | awk '{print $2}')
    TOPWINDOW=$(hyprctl clients | awk -v RS= -v ORS='\n\n' "/class: top/ {print $i}" | grep pid | awk '{print $2}')
    kill $NEOWINDOW
    kill $TOPWINDOW
    eww update statsvisible=false
    exec /home/ezra/.config/hypr/windows.sh 1.0 &
    eww close stats
else
    eww open stats
    exec /home/ezra/.config/hypr/windows.sh 0.0 &
    eww update statsvisible=true
    alacritty --title "we are so back" --class top --hold -e top &
    alacritty -o 'window.padding.y=47' -o 'window.padding.x=40' --class neo --hold -e neofetch &
fi