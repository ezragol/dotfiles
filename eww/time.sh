#!/bin/zsh

TIME=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Position' |cut -d " " -f 12)
echo $($HOME/.config/eww/format_time.sh $TIME)
