#!/usr/bin/env sh

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -S linux-firmware-intel intel-video-accel mesa-dri mesa-vulkan-intel \
                     vulkan-loader vulkan-loader-32bit Vulkan-Tools Vulkan-ValidationLayers Vulkan-ValidationLayers-32bit \
                     glxinfo glxgears

if ! grep -E 'GRUB_CMDLINE_LINUX_DEFAULT=".*i915.modeset=1.*"' /etc/default/grub; then
	sudo sed -i -E 's|GRUB_CMDLINE_LINUX_DEFAULT="(.*?)"|GRUB_CMDLINE_LINUX_DEFAULT="\1 i915.modeset=1"|g' /etc/default/grub
fi
