#!/bin/zsh

CLIENTS=$(pactl list short clients | awk 'substr($0,3)+0' | awk '{print $3}' | grep -v i3status | grep -v pactl)
echo $CLIENTS
