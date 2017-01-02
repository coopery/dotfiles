#!/bin/bash

PLAY=""
PAUSE=""

STATUS=$(playerctl status)

SYMBOL=""
# if playing
if [ "$STATUS" = "Playing" ]; then
	SYMBOL=$PLAY
elif [ "$STATUS" = "Paused" ]; then
	SYMBOL=$PAUSE
else
	echo "  nothing playing"
	exit 0
fi

METADATA=$(playerctl metadata)

#ARTIST=$(echo $METADATA | awk -F "xesam:artist': " '{print $2}' | cut -d "'" -f 1)
ARTIST=$(echo $METADATA | awk -F "xesam:artist': " '{print $2}' | sed "s/<\['//" - | sed "s/'\]>.*//" -)

SONG=$(echo $METADATA | awk -F "xesam:title': " '{print $2}' | sed "s/<['\"]//" - | sed "s/['\"]>.*//" -)

echo "  [$SONG by $ARTIST]  $SYMBOL"
