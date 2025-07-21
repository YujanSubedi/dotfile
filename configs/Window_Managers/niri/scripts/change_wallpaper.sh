#!/bin/bash

if command -v swaybg &>/dev/null; then
	last_wallpaper=$(ps -p $(pgrep swaybg) -o cmd= | cut -d '/' -f 6)
	new_wallpaper=$(find ~/Pictures/Wallpapers -name "*.jpg" | shuf -n 1 | cut -d "/" -f 6)

	pkill swaybg
	swaybg -m "fill" -i "${HOME}/Pictures/Wallpapers/${new_wallpaper}" &

	notify-send "Wallpapers" "${last_wallpaper} -> ${new_wallpaper}"
fi
