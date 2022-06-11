#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree || error "Failed to enable repos"
		sudo xbps-install -Sy linux-firmware-amd xf86-video-amdgpu mesa-vulkan-radeon mesa-vulkan-radeon-32bit amdvlk amdvlk-32bit || error "Failed to install packages"
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon amdvlk lib32-amdvlk libva-mesa-driver mesa-vdpau || error "Failed to install packages"
	;;
esac
