#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
		sudo xbps-install -Sy linux-firmware-intel intel-video-accel mesa-dri mesa-vulkan-intel
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu vulkan-intel libva-intel-driver intel-media-driver
	;;
esac

if ! grep -E 'GRUB_CMDLINE_LINUX_DEFAULT=".*i915.modeset=1.*"' /etc/default/grub; then
	sudo sed -i -E 's|GRUB_CMDLINE_LINUX_DEFAULT="(.*?)"|GRUB_CMDLINE_LINUX_DEFAULT="\1 i915.modeset=1"|g' /etc/default/grub
fi
