#!/bin/zsh

TOGGLE=~/.config/i3/.toggle

if [ ! -e $TOGGLE ] ; then
	touch $TOGGLE
	i3-msg "gaps right all set 448"	
	sleep 0.1	
	i3-msg "[class=\"Conky\" title=\"conky\"] scratchpad show"
else

	i3-msg "[class=\"Conky\" title=\"conky\"] move scratchpad"
	sleep 0.3
	i3-msg "gaps right all set 0"
	rm $TOGGLE
fi

