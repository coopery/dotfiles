#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/*"
INTERVAL="15m"


FILES=($WALLPAPER_DIR)

i=$(shuf -i 0-$(( ${#FILES[@]} - 1)) -n 1)
while true; do
	echo "Setting wallpaper: ${FILES[$i]}"
	if [[ ${FILES[$i]} == *europa_jupiter.jpg ]]; then
		feh --bg-fill "${FILES[$i]}"
	else
		feh --bg-scale "${FILES[$i]}"
	fi

	((i++))
	if [ $i -ge ${#FILES[@]} ]; then
		i=0
	fi

	sleep $INTERVAL
done
