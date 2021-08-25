#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-multilib
		sudo xbps-install -Sy xf86-video-qxl xf86-video-qxl-32bit
	;;
	arch)
		sudo pacman -Syu xf86-video-qxl
	;;
esac
