#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

case $DESKTOP_SESSION in
	bspwm|/usr/share/xsessions/bspwm)
		if type "xrandr" > /dev/null; then
			for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
				MONITOR=$m exec polybar --reload bspwm -c ~/.config/polybar/config.ini &
			done
		else
			exec polybar --reload bspwm -c ~/.config/polybar/config.ini &
		fi
		;;
	i3|/usr/share/xsessions/i3)
		if type "xrandr" > /dev/null; then
			for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
				MONITOR=$m exec polybar --reload i3 -c ~/.config/polybar/config.ini &
			done
		else
			exec polybar --reload i3 -c ~/.config/polybar/config.ini &
		fi
		;;
	*)
		if type "xrandr" > /dev/null; then
			for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
				MONITOR=$m exec polybar --reload base -c ~/.config/polybar/config.ini &
			done
		else
			exec polybar --reload base -c ~/.config/polybar/config.ini &
		fi
		;;
esac
