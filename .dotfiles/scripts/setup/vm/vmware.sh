#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy xf86-video-vmware
	;;
	arch)
		sudo pacman -Syu xf86-video-vmware
	;;
esac
