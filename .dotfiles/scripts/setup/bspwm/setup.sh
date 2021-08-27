#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
case "$DISTRO" in
	void)
		sudo xbps-install -Sy dex bspwm sxhkd polybar dunst rofi i3lock-color yad \
			qjackctl pamixer pavucontrol \
			xwallpaper kvantum qt5ct papirus-icon-theme \
			xdg-desktop-portal xdg-desktop-portal-kde \
			playerctl light numlockx lxqt-policykit xplugd xss-lock wmname redshift redshift-gtk rofi-emoji || error "Failed to install packages"
	;;
	arch)
		paru --needed --noconfirm  -Syu dex bspwm picom-git sxhkd polybar dunst rofi i3lock-color yad \
			qjackctl pamixer pavucontrol \
			xwallpaper kvantum-qt5 qt5ct papirus-icon-theme \
			xdg-desktop-portal xdg-desktop-portal-kde \
			playerctl light numlockx lxqt-policykit xplugd-git xss-lock wmname redshift rofi-emoji || error "Failed to install packages"

	;;
esac

log_info "Installing themes"
LOG_SIGN="$LOG_SIGN>" "$DIR"/themes.sh || error "Failed to install themes"
