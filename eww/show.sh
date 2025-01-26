#!/bin/zsh
STATE=$(eww state | grep $1 | awk '{print $2}')
if [ "$STATE" = "true" ]; then
    NEWSTATE="false"
else
    NEWSTATE="true"
fi

eww update $1=$NEWSTATE