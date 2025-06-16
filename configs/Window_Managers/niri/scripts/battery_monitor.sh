#!/bin/bash

while true; do
	Battery=$(cat /sys/class/power_supply/BAT0/capacity)
	[ "$Battery" -le "30" ] && notify-send -u critical "low battery at $Battery%"
	# [ "$Battery" -le "15" ] && poweroff;
	sleep 120
done
