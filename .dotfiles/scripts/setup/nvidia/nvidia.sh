#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -S mesa mesa-dri mesa-32bit mesa-vaapi mesa-vdpau mesa-demos glxinfo \
                     vulkan-loader vulkan-loader-32bit Vulkan-Tools Vulkan-ValidationLayers Vulkan-ValidationLayers-32bit \
                     linux-firmware-nvidia nvidia nvidia-libs nvidia-libs-32bit
