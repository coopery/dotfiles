#!/bin/bash

PLAY=""
PAUSE=""

STATUS=$(playerctl status)

# if playing
if [ "$STATUS" = "Playing" ]; then
	echo -n $PLAY
elif [ "$STATUS" = "Paused" ]; then
	echo -n $PAUSE
else
	echo " Nothing playing."
	exit 0
fi

METADATA=$(playerctl metadata)

#ARTIST=$(echo $METADATA | awk -F "xesam:artist': " '{print $2}' | cut -d "'" -f 1)
ARTIST=$(echo $METADATA | awk -F "xesam:artist': " '{print $2}' | sed "s/<\['//" - | sed "s/'\]>.*//" -)

SONG=$(echo $METADATA | awk -F "xesam:title': " '{print $2}' | sed "s/<'//" - | sed "s/'>.*//" -)

echo " $ARTIST - $SONG"
