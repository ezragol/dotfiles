STATUS=$(eww get dnd)

if [ "$STATUS" = "false" ]; then
    dunstctl rule dnd enable
else
    dunstctl rule dnd disable
fi