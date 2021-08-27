#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
case "$DISTRO" in
	void)
		sudo xbps-install -Sy void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree || error "Failed to enable repos"
		sudo xbps-install -Sy linux-firmware-intel intel-video-accel mesa-dri mesa-vulkan-intel || error "Failed to install packages"
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu vulkan-intel libva-intel-driver intel-media-driver || error "Failed to install packages"
	;;
esac

if ! grep -E 'GRUB_CMDLINE_LINUX_DEFAULT=".*i915.modeset=1.*"' /etc/default/grub; then
	log_info "Adding kernel cmdline parameters to grub config"
	sudo sed -i -E 's|GRUB_CMDLINE_LINUX_DEFAULT="(.*?)"|GRUB_CMDLINE_LINUX_DEFAULT="\1 i915.modeset=1"|g' /etc/default/grub || error "Failed to edit grub config"
	sudo grub-mkconfig -o /boot/grub/grub.cfg || error "Failed to generate grub config"
fi
