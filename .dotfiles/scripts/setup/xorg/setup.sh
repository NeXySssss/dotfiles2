#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -S mesa mesa-dri mesa-32bit mesa-dri-32bit mesa-vaapi mesa-vaapi-32bit mesa-vdpau mesa-vdpau-32bit mesa-demos glxinfo \
                     vulkan-loader vulkan-loader-32bit Vulkan-Tools Vulkan-ValidationLayers Vulkan-ValidationLayers-32bit \
                     xorg-minimal xorg-input-drivers xrandr sx xclip xsel xsetroot xprop setxkbmap \
                     dbus-elogind dbus-elogind-libs dbus-elogind-x11 \
                     xdg-desktop-portal xdg-desktop-portal-kde \
                     kitty firefox vlc mpv CopyQ ark dolphin gwenview kdeconnect \
                     pipewire pipewire-32bit libjack-pipewire libjack-pipewire-32bit alsa-pipewire alsa-pipewire-32bit rtkit

sudo cp "$DIR"/mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

"$DIR"/custom-packages.sh
"$DIR"/fonts.sh
