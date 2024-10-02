#!/bin/zsh

curl https://wttr.in/Boston\?format=j1 | jq '.current_condition[0].weatherDesc[0].value'