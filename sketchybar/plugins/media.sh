#!/bin/bash

STATE="$(echo "$INFO" | jq -r '.state')"
if [ "$STATE" = "playing" ]; then
    MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist' | sed 's/（[^）]*）//g; s/(.*)//g')"
    sketchybar --set $NAME label="$MEDIA" icon="􀑪" drawing=on
else
    sketchybar --set $NAME label="" icon="" drawing=on
fi
