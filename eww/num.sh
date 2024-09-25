#!/bin/zsh

hyprctl clients | grep "class: $1" |  wc -l