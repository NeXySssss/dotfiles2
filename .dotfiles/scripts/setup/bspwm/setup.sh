#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy dex bspwm sxhkd polybar dunst rofi i3lock-color yad \
                              qjackctl pamixer pavucontrol \
                              xwallpaper kvantum qt5ct papirus-icon-theme \
                              playerctl light numlockx lxqt-policykit xplugd xss-lock wmname redshift redshift-gtk rofi-emoji
	;;
	arch)
		paru --needed --noconfirm  -Syu dex bspwm sxhkd polybar dunst rofi i3lock-color yad \
		               qjackctl pamixer pavucontrol \
		               xwallpaper kvantum qt5ct papirus-icon-theme \
		               playerctl light numlockx lxqt-policykit xplugd-git xss-lock wmname redshift rofi-emoji

		"$DIR"/custom-packages.sh
	;;
esac

"$DIR"/themes.sh
