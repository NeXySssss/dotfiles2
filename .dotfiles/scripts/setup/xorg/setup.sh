#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree || error "Failed to enable repos"
		sudo xbps-install -Sy mesa mesa-dri mesa-32bit mesa-dri-32bit mesa-vaapi mesa-vaapi-32bit mesa-vdpau mesa-vdpau-32bit mesa-demos glxinfo \
			vulkan-loader vulkan-loader-32bit Vulkan-Tools Vulkan-ValidationLayers Vulkan-ValidationLayers-32bit \
			xorg-minimal xorg-input-drivers libinput-gestures xrandr sx xclip xsel xsetroot xprop setxkbmap \
			kitty firefox vlc mpv CopyQ ark dolphin gwenview kdeconnect kcolorchooser qalculate-gtk \
			pipewire pipewire-32bit libjack-pipewire libjack-pipewire-32bit alsa-pipewire alsa-pipewire-32bit rtkit || error "Failed to install packages"
		log_info "Installing custom packages"
		LOG_SIGN="$LOG_SIGN>" "$DIR"/custom-packages.sh || error "Failed to install custom packages"
	;;
	arch)
		paru --needed --noconfirm  -Syu mesa lib32-mesa mesa-demos mesa-vdpau lib32-mesa-vdpau \
			vulkan-icd-loader lib32-vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools \
			xorg-server xorg-setxkbmap xorg-xdpyinfo xorg-xinput libinput-gestures xorg-xrandr xorg-xsetroot xorg-xprop sx xclip xsel \
			kitty firefox vlc mpv copyq ark dolphin gwenview kdeconnect kcolorchooser qalculate-gtk flameshot-33kk-git \
			pipewire lib32-pipewire pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack || error "Failed to install packages"
	;;
esac

log_info "Disabling mouse acceleration"
sudo cp "$DIR"/mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf || error "Failed to disable mouse acceleration"

log_info "Configuring touchpad"
sudo cp "$DIR"/touchpad.conf /etc/X11/xorg.conf.d/50-touchpad.conf || error "Failed to configure touchpad"

log_info "Installing fonts"
LOG_SIGN="$LOG_SIGN>" "$DIR"/fonts.sh || error "Failed to install fonts"
