#!/bin/bash

if command -v hyprpaper &>/dev/null; then
	last_wallpaper=$(ps -p $(pgrep sway) -o cmd= | cut -d '/' -f 6)
	new_wallpaper=$(find ~/Pictures/Wallpapers -name "*.jpg" | shuf -n 1 | cut -d "/" -f 4,5,6)

	pkill swaybg
	swaybg -i "${new_wallpaper}" &

	notify-send "Last wallpaper:${last_wallpaper}" "New wallpaper:${new_wallpaper}"
fi
