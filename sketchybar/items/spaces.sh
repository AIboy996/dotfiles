#!/bin/bash

# 只显示四个space
SPACE_ICONS=("Pin" "Web" "CI" "Re")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"; do
	sid=$(($i + 1))

	space=(
		associated_space=$sid
		icon="${SPACE_ICONS[i]}"
		icon.padding_left=10
		icon.padding_right=0
		padding_left=2
		padding_right=2
		label.padding_right=20
		icon.highlight_color=$WHITE
		label.color=$WHITE
		label.highlight_color=$WHITE
		label.font="sketchybar-app-font:Regular:16.0"
		label.y_offset=-1
		background.color=$BACKGROUND_1
		background.border_color=$BACKGROUND_2
		background.drawing=off
		label.drawing=off
		script="$PLUGIN_DIR/space.sh"
	)

	sketchybar --add space space.$sid left \
		--set space.$sid "${space[@]}" \
		--subscribe space.$sid mouse.clicked space_windows_change
done

spaces_bracket=(
	background.color=$BACKGROUND_1
	background.border_color=$BACKGROUND_2
)

separator=(
	icon="$"
	icon.font="$FONT:Heavy:16.0"
	padding_left=0
	padding_right=0
	label.drawing=off
	associated_display=active
	# click_script='yabai -m space --create && sketchybar --trigger space_change'
	icon.color=$WHITE
)

sketchybar --add bracket spaces_bracket '/space\..*/' \
	--set spaces_bracket "${spaces_bracket[@]}" \
	\
	--add item separator left \
	--set separator "${separator[@]}"
