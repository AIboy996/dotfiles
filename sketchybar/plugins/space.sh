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
  if [ "$BUTTON" = "right" ]; then
    # yabai -m space --destroy $SID
    sketchybar --trigger windows_on_spaces --trigger space_change
  else
    # yabai -m space --focus $SID 2>/dev/null
    # https://eastmanreference.com/complete-list-of-applescript-key-codes
    # simulate control+18, 19, 20
    osascript -e "tell application \"System Events\" to key code $((SID+17)) using control down"
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
