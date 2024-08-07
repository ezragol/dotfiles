#!/bin/zsh

CURRENT_WS=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')
TOTAL_WS=$(i3-msg -t get_workspaces | jq 'length')

if [ "$CURRENT_WS" = "$TOTAL_WS" ] ; then
	i3-msg "workspace number \"1\""
else
	i3-msg "workspace next"
fi
