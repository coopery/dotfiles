#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/*"
INTERVAL="15m"


FILES=($WALLPAPER_DIR)

i=$(shuf -i 0-$(( ${#FILES[@]} - 1)) -n 1)
while true; do
	echo "Setting wallpaper: ${FILES[$i]}"
	feh --bg-scale "${FILES[$i]}"

	((i++))
	if [ $i -ge ${#FILES[@]} ]; then
		i=0
	fi

	sleep $INTERVAL
done
