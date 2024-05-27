#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Black:14.0"
  icon.padding_right=0
  label.width=45
  label.align=right
  padding_left=5
  update_freq=30
  script="$PLUGIN_DIR/calender.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke