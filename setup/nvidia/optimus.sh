#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

if [ ! -d /etc/X11/xorg.conf.d ]; then
	sudo mkdir -p /etc/X11/xorg.conf.d
fi

log_info "Installing xorg config"
sudo cp "$DIR"/x11-nvidia-optimus.conf /etc/X11/xorg.conf.d/10-nvidia-optimus.conf || error "Failed to install xorg config"

if ! grep -E 'GRUB_CMDLINE_LINUX_DEFAULT=".*nvidia-drm.modeset=1.*"' /etc/default/grub; then
	log_info "Adding kernel cmdline parameters to grub config"
	sudo sed -i -E 's|GRUB_CMDLINE_LINUX_DEFAULT="(.*?)"|GRUB_CMDLINE_LINUX_DEFAULT="\1 nvidia-drm.modeset=1"|g' /etc/default/grub || error "Failed to edit grub kernel cmdline"
	sudo grub-mkconfig -o /boot/grub/grub.cfg || error "Failed to generate grub config"
fi

# TODO: Check if this is necessary
# if [ "$DISTRO" = "void" -a ! -e /etc/dracut.conf.d/10-nvidia-drm.conf ]; then
# 	echo 'kernel_cmdline="nvidia-drm.modeset=1 i915.modeset=1"' | sudo tee /etc/dracut.conf.d/10-nvidia-drm.conf || error "Failed to set dracut kernel cmdline"
# 	sudo dracut -f || error "Failed to build initramfs image"
# fi
