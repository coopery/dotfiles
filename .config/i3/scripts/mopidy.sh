#!/bin/bash

PLAY=""
PAUSE=""

STATUS=$(mpc)

# if mopidy is down
if [ -z "$STATUS" ]; then
	echo "mopidy down"
	exit 0
fi

STATUS=$(echo "$STATUS" | grep -v '^volume:')

# if not playing
if [ -z "$STATUS" ]; then
	echo "nothing playing"
	exit 0
fi

PLAYING=$(echo "$STATUS" | tail -n1 | cut -d ']' -f 1 | tr -d '[')

[ "$PLAYING" = "playing" ] && echo -n $PLAY || echo -n $PAUSE

SONG=$(echo "$STATUS" | head -n1)

TIME=$(echo "$STATUS" | tail -n1 | awk '{print $3}')

echo " $SONG [$TIME]"
