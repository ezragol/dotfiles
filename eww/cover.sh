#!/bin/zsh

playerctl metadata --format "{{mpris:artUrl}}" --follow | while IFS= read -r line; do
	if [[ $line == *"http"* ]]; then
		CACHE_DIR="$HOME/.cache/album_art_cache"
		mkdir -p "$CACHE_DIR"
		FILE_NAME=$(basename "$line")
		FILE_PATH="$CACHE_DIR/$FILE_NAME"
		if [ -e "$FILE_PATH" ]; then
			echo "$FILE_PATH"
		else
			curl --output "$FILE_PATH" "$line" > /dev/null 2>&1
			echo "$FILE_PATH"
		fi
	fi
done
