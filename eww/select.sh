#!/bin/zsh

for CLASS in $(hyprctl clients | grep class | cut -d ':' -f2 | xargs);
do
    if [ "$CLASS" = "$1" ]; then
        WORKSPACE=$(hyprctl clients | awk "/$CLASS/" RS= | grep workspace | cut -d ':' -f2 | awk '{print $1}')
        hyprctl dispatch workspace $WORKSPACE
        exit
    fi
done

/home/ezra/.config/hypr/statswitch.sh hide
$2