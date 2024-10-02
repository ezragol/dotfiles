#!/bin/zsh

STATUS=$(eww active-windows | grep stats)

if [[ "$STATUS" ]]; then
    NEOWINDOW=$(hyprctl clients | awk -v RS= -v ORS='\n\n' "/class: neo/ {print $i}" | grep pid | awk '{print $2}')
    TOPWINDOW=$(hyprctl clients | awk -v RS= -v ORS='\n\n' "/class: top/ {print $i}" | grep pid | awk '{print $2}')
    kill $NEOWINDOW
    kill $TOPWINDOW
    eww update statsvisible=false
    exec /home/ezra/.config/hypr/windows.sh 1.0 &
    eww close stats
else
    if [ "$1" != "hide" ]; then
        eww open stats
        exec /home/ezra/.config/hypr/windows.sh 0.0 &
        eww update statsvisible=true
        alacritty --title "can you meet me halfway" --class top --hold -e top &
        alacritty -o 'window.padding.y=46' -o 'window.padding.x=40' --class neo --hold -e neofetch &
    fi
fi