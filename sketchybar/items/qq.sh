#!/bin/bash

qq=(
	update_freq=10
	icon=$QQ
	icon.font="$FONT:Regular:19.0"
	icon.padding_left=10
	label.padding_right=0
	script="$PLUGIN_DIR/app_status.sh"
	click_script="open -a qq"
)

tencent_bracket=(
	background.color=$BLACK
	background.border_color=$TRANSPARENT
)

sketchybar --add item qq right \
	--set qq "${qq[@]}"
sketchybar --add bracket tencent qq wechat battery calendar\
	--set tencent "${tencent_bracket[@]}"
