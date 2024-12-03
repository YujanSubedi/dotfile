#!/bin/sh

# Kill existing wofi
killall wofi

# Get title and address
address_str=$(hyprctl clients -j | jq '.[].address' | tr -d '"')
title_str=$(hyprctl clients -j | jq '.[].title' | tr -d '"')

# Parse the title and address_value
selected_title=$(echo "$title_str" | wofi -d)
value_index=$(echo "$title_str" | grep -n "$selected_title" | sed -n '1p' | awk -F ":" '{print $1}')

# echo "$value_index"
# Change fouces
address_value=$(echo "$address_str" | sed -n "${value_index}p")
# echo $address_value
hyprctl dispatch focuswindow "address:${address_value}"
