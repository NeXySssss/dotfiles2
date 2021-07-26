#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp $DIR/../../../system/x11-nvidia-optimus.conf /etc/X11/xorg.conf.d/10-nvidia-optimus.conf
sudo cp $DIR/../../../system/dracut-nvidia-drm.conf /etc/dracut.conf.d/10-nvidia-drm.conf

if ! grep -E 'GRUB_CMDLINE_LINUX_DEFAULT=".*nvidia-drm.modeset=1.*"' /etc/default/grub; then
	sudo sed -i -E 's|GRUB_CMDLINE_LINUX_DEFAULT="(.*?)"|GRUB_CMDLINE_LINUX_DEFAULT="\1 nvidia-drm.modeset=1"|g' /etc/default/grub
fi

sudo dracut -f
sudo grub-mkconfig -o /boot/grub/grub.cfg
