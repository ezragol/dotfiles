#!/bin/zsh

POS=$(hyprctl cursorpos | awk -F "," '{print $1 $2}')
X=$(echo $POS | awk '{print $1}')
Y=$(echo $POS | awk '{print $2}')

STATUS=$(eww get statsvisible)

if [ "$STATUS" = "true" ]; then

    if [ "$X" -le "537" ]; then
        exec /home/ezra/.config/hypr/statswitch.sh
    fi

    if [ "$X" -ge "1383" ]; then
        exec /home/ezra/.config/hypr/statswitch.sh
    fi

    if [ "$Y" -le "462" ]; then
        exec /home/ezra/.config/hypr/statswitch.sh
    fi

    if [ "$Y" -ge "775" ]; then
        exec /home/ezra/.config/hypr/statswitch.sh
    fi
fi
