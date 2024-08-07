#!/bin/zsh

TIME=$1
TIME=$((TIME / 1000))
MINUTES=$((TIME / 60000))
SECONDS=$((TIME % 60000 / 1000))
if [ "$SECONDS" -lt "10" ] ; then
        echo "$MINUTES:0$SECONDS"
else
        echo "$MINUTES:$SECONDS"
fi
