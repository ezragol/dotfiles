#!/bin/zsh

DEFAULT=$(pactl get-default-sink)
pactl set-sink-volume $DEFAULT -1%
