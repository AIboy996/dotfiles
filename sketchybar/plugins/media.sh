#!/bin/bash
# echo $INFO
# { "state": "paused", "title": "A Winter Story", "album": "Love Letter", "artist": "麗美", "app": "音乐" }
STATE="$(echo "$INFO" | jq -r '.state')"
APP="$(echo "$INFO" | jq -r '.app')"
if [[ "$STATE" = "playing" && "$APP" = "音乐" ]]; then
    MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist' | sed 's/（[^）]*）//g; s/(.*)//g')"
    sketchybar --set $NAME label="$MEDIA" icon="􀑪" drawing=on
else
    sketchybar --set $NAME label="" icon="" drawing=on
fi
