#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
		sudo xbps-install -Sy linux-firmware-amd xf86-video-amdgpu mesa-vulkan-radeon mesa-vulkan-radeon-32bit amdvlk amdvlk-32bit
	;;
	arch)
		sudo pacman --needed -Syu xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon amdvlk lib32-amdvlk libva-mesa-driver mesa-vdpau
	;;
esac
