#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
case "$DISTRO" in
	void)
		sudo xbps-install -Sy xf86-video-vmware || error "Failed to install packages"
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu xf86-video-vmware || error "Failed to install packages"
	;;
esac
