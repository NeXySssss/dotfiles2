#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree || error "Failed to enable repos"
		sudo xbps-install -Sy linux-firmware-nvidia nvidia nvidia-libs nvidia-libs-32bit || error "Failed to install packages"
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings libva-vdpau-driver || error "Failed to install packages"
	;;
esac

