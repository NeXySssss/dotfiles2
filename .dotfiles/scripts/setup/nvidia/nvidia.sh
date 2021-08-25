#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
		sudo xbps-install -Sy linux-firmware-nvidia nvidia nvidia-libs nvidia-libs-32bit
	;;
	arch)
		sudo pacman -Syu nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings libva-vdpau-driver
	;;
esac

