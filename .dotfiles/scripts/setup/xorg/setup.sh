#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S void-repo-multilib
sudo xbps-install -S xorg-minimal xorg-input-drivers xrandr sx xclip xsel xsetroot xprop setxkbmap \
                     dbus-elogind dbus-elogind-libs dbus-elogind-x11 \
                     xdg-desktop-portal xdg-desktop-portal-kde \
                     kitty firefox vlc mpv CopyQ ark dolphin gwenview kdeconnect \
                     pipewire pipewire-32bit libjack-pipewire libjack-pipewire-32bit alsa-pipewire alsa-pipewire-32bit rtkit

sudo cp "$DIR"/mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

"$DIR"/custom-packages.sh
"$DIR"/fonts.sh
