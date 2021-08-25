#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
		sudo xbps-install -Sy mesa mesa-dri mesa-32bit mesa-dri-32bit mesa-vaapi mesa-vaapi-32bit mesa-vdpau mesa-vdpau-32bit mesa-demos glxinfo \
		                      vulkan-loader vulkan-loader-32bit Vulkan-Tools Vulkan-ValidationLayers Vulkan-ValidationLayers-32bit \
		                      xorg-minimal xorg-input-drivers xrandr sx xclip xsel xsetroot xprop setxkbmap \
		                      dbus-elogind dbus-elogind-libs dbus-elogind-x11 \
		                      xdg-desktop-portal xdg-desktop-portal-kde \
		                      kitty firefox vlc mpv CopyQ ark dolphin gwenview kdeconnect kcolorchooser \
		                      pipewire pipewire-32bit libjack-pipewire libjack-pipewire-32bit alsa-pipewire alsa-pipewire-32bit rtkit
		"$DIR"/custom-packages.sh
	;;
	arch)
		sudo paru --needed -Syu mesa lib32-mesa mesa-demos mesa-vdpau lib32-mesa-vdpau \
		               vulkan-icd-loader lib32-vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools \
		               xorg-server xorg-setxkbmap xorg-xdpyinfo xorg-xinput xorg-xrandr xorg-xsetroot xorg-xprop sx xclip xsel \
		               dbus-broker \
		               xdg-desktop-portal xdg-desktop-portal-kde \
		               kitty firefox vlc mpv copyq ark dolphin gwenview kdeconnect kcolorchooser \
		               pipewire lib32-pipewire pipewire-jack lib32-pipewire-jack pipewire-jack-dropin pipewire-pulse
	;;
esac

sudo cp "$DIR"/mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

"$DIR"/fonts.sh
