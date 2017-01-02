#!/bin/bash

NHL_URL="http://www.hockey-reference.com/teams/WSH/2017.html"

CONTENT="$(curl -s "$NHL_URL")"

LAST_GAME="$(echo "$CONTENT" | grep "Last Game:" | awk -F">" '{print $5}' | awk -F"<" '{print $1}')"

if [[ $LAST_GAME == L* ]]; then
	SYMBOL=""
else
	SYMBOL=""
fi

echo $SYMBOL $LAST_GAME
