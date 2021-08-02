#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp "$DIR"/x11-nvidia-optimus.conf /etc/X11/xorg.conf.d/10-nvidia-optimus.conf
echo 'kernel_cmdline="nvidia-drm.modeset=1 i915.modeset=1"' | sudo tee /etc/dracut.conf.d/10-nvidia-drm.conf

if ! grep -E 'GRUB_CMDLINE_LINUX_DEFAULT=".*nvidia-drm.modeset=1.*"' /etc/default/grub; then
	sudo sed -i -E 's|GRUB_CMDLINE_LINUX_DEFAULT="(.*?)"|GRUB_CMDLINE_LINUX_DEFAULT="\1 nvidia-drm.modeset=1"|g' /etc/default/grub
fi

sudo dracut -f
sudo grub-mkconfig -o /boot/grub/grub.cfg
