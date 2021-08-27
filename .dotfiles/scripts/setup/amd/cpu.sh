#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree || error "Failed to enable repos"
		sudo xbps-install -Sy linux-firmware-amd || error "Failed to install packages"
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu amd-ucode || error "Failed to install packages"
	;;
esac
