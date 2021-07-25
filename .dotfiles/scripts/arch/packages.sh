#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo pacman -Syu dex bspwm sxhkd polybar dunst rofi betterlockscreen yad \
                 base-devel dbus \
                 xdg-desktop-portal xdg-desktop-portal-kde xdg-user-dirs xdg-utils \
                 playerctl light numlockx lxqt-policykit picom wmname redshift redshift-gtk \
                 zsh zoxide git bat ripgrep exa neovim htop jq curl aria2 unzip neofetch \
                 kitty firefox vlc mpv CopyQ ark dolphin kdeconnect \
                 qjackctl pamixer pavucontrol \
                 xorg-minimal sx xclip xsel xsetroot xprop setxkbmap \
                 hsetroot kvantum qt5ct papirus-icon-theme

ln -s /etc/sv/chronyd /var/service
ln -s /etc/sv/elogind /var/service

$DIR/custom-packages.sh
