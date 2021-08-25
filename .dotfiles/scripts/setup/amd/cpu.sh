#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree
		sudo xbps-install -Sy linux-firmware-amd
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu amd-ucode
	;;
esac
