#!/bin/bash

if command -v hyprpaper &>/dev/null; then
	last_wallpaper=$(grep "wallpaper" ~/.config/hypr/hyprpaper.conf | cut -d "=" -f 2)
	new_wallpaper=$(find ~/Pictures/Wallpapers -name "*.jpg" | shuf -n 1 | cut -d "/" -f 4,5,6)

	printf "preload = ~/%s\nwallpaper = , ~/%s" "${new_wallpaper}" "${new_wallpaper}" >~/.config/hypr/hyprpaper.conf

	# echo "preload = ~/${new_wallpaper}" >~/.config/hypr/hyprpaper.conf
	# echo "wallpaper = , ~/${new_wallpaper}" >>~/.config/hypr/hyprpaper.conf

	pkill hyprpaper
	notify-send "Last wallpaper" "${last_wallpaper}"
fi
