#!/usr/bin/env bash

kill $(pgrep -U $UID polybar)
while pgrep -U $UID polybar > /dev/null; do sleep 1; done

run() {
	if type "xrandr" > /dev/null; then
		for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
			MONITOR=$m exec polybar --reload $1 -c ~/.config/polybar/config.ini
		done
	else
		exec polybar --reload $1 -c ~/.config/polybar/config.ini
	fi
}

case $DESKTOP_SESSION in
	*bspwm*) run bspwm ;;
	*i3*) run i3 ;;
	*) run base ;;
esac
