#!/bin/bash

options=" Lock\n Reboot\n Shutdown"

selected_option=$(echo -e "$options" | rofi -dmenu -i -p " " -theme ~/.config/rofi/config.rasi)

case "$selected_option" in
    " Lock")
		systemctl suspend
		i3lock -e -i ~/.config/rofi/lock.png
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Shutdown")
        systemctl poweroff
        ;;
esac
