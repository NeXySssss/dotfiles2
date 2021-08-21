#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -Sy dex bspwm sxhkd polybar dunst rofi i3lock-color yad \
                     qjackctl pamixer pavucontrol \
                     xwallpaper kvantum qt5ct papirus-icon-theme \
                     playerctl light numlockx lxqt-policykit xplugd xss-lock wmname redshift redshift-gtk rofi-emoji

"$DIR"/themes.sh
