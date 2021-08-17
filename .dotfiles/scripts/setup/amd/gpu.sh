#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -S mesa mesa-dri mesa-32bit mesa-dri-32bit mesa-vaapi mesa-vaapi-32bit mesa-vdpau mesa-vdpau-32bit mesa-demos glxinfo \
                     vulkan-loader vulkan-loader-32bit Vulkan-Tools Vulkan-ValidationLayers Vulkan-ValidationLayers-32bit \
                     linux-firmware-amd xf86-video-amdgpu xf86-video-ati amdvlk amdvlk-32bit
