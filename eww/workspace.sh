#!/bin/zsh

eww update workspace="$(hyprctl activeworkspace -j | jq .id)"