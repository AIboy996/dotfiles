#!/bin/bash

sketchybar --add item media e \
    --set media label.color=$WHITE \
    label.max_chars=25 \
    icon.padding_right=10 \
    scroll_texts=on \
    icon=􀑪 \
    icon.color=$WHITE \
    background.drawing=off \
    script="$PLUGIN_DIR/media.sh" \
    click_script="open -a music"\
    --subscribe media media_change
