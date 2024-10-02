#!/bin/zsh

curl wttr.in\?format=j1 | jq '.current_condition[0].weatherDesc[0].value' -r