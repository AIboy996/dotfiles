#!/bin/bash

update() {
  source "$CONFIG_DIR/colors.sh"
  COLOR=$BACKGROUND_2
  if [ "$SELECTED" = "true" ]; then
    COLOR=$GREY
  fi
  sketchybar --set $NAME icon.highlight=$SELECTED \
                         label.highlight=$SELECTED \
                         background.border_color=$COLOR
}

mouse_clicked() {
  if [ "$BUTTON" = "left" ]; then
  # https://eastmanreference.com/complete-list-of-applescript-key-codes
  # simulate control+18, 19, 20
  osascript -e "tell application \"System Events\" to key code $((SID+17)) using control down"
  sketchybar --trigger space_change
  fi
  # remove: 
  # yabai -m space --destroy $SID
  # yabai -m space --focus $SID 2>/dev/null
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "space_windows_change")
  sketchybar --trigger windows_on_spaces
  ;;
  *) update
  ;;
esac