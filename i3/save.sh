#!/bin/zsh

# save primary screen to json file

DISPLAY_NAME=$(xrandr | grep "\sconnected primary" | cut -f1 -d ' ')

i3-save-tree --output=$DISPLAY_NAME > ~/.config/i3/save_state.json
