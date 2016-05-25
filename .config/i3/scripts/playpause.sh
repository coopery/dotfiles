#!/bin/bash

STATUS_FILE="/tmp/playpausestatus"

if [ "$(cat $STATUS_FILE)" == "paused" ]; then
	bash "/usr/local/google/home/coopery/.config/i3/scripts/play.sh"
	echo "playing" > $STATUS_FILE
else
	bash "/usr/local/google/home/coopery/.config/i3/scripts/pause.sh"
	echo "paused" > $STATUS_FILE
fi
