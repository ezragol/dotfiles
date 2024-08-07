#!/bin/zsh

LENGTH=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep -A 2 "length" | awk '{print $3}')
echo $(~/.config/conky/scripts/format_time.sh $LENGTH)
