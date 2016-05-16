#!/bin/bash

STATUS_FILE="/tmp/playpausestatus"

if [ "playing" == "$(cat $STATUS_FILE)" ]; then
	bash "/home/coopery/.config/i3/scripts/pause.sh"
	echo "paused" > $STATUS_FILE
else
	bash "/home/coopery/.config/i3/scripts/play.sh"
	echo "playing" > $STATUS_FILE
fi
