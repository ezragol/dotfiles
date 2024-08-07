#!/bin/zsh

DEFAULT=$(pactl get-default-sink)
pactl set-sink-mute $DEFAULT toggle
