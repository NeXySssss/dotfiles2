#!/usr/bin/env bash

pids="$(pgrep -U "$UID" polybar)"
kill $pids
while pgrep -U "$UID" polybar >/dev/null; do sleep 1; done

run() {
	if type "xrandr" > /dev/null; then
		primary="$(polybar -m | grep "(primary)" | cut -d ':' -f 1)"
		monitors="$(polybar -m | grep --invert-match "(primary)" | cut -d ':' -f 1)"
		if [ "$primary" ]; then
			MONITOR=$primary polybar --reload "$1" -c ~/.config/polybar/config.ini & disown
			for m in $monitors; do
				MONITOR="$m" polybar --reload "$1"-side -c ~/.config/polybar/config.ini & disown
			done
		else
			for m in $monitors; do
				MONITOR="$m" polybar --reload "$1" -c ~/.config/polybar/config.ini & disown
			done
		fi
	else
		exec polybar --reload "$1" -c ~/.config/polybar/config.ini
	fi
}

case $DESKTOP_SESSION in
	*bspwm*) run bspwm ;;
	*i3*) run i3 ;;
	*) run default ;;
esac
