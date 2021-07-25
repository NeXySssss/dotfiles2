#!/usr/bin/env sh

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -S linux-firmware-intel intel-video-accel mesa-dri mesa-vulkan-intel \
                     vulkan-loader vulkan-loader-32bit Vulkan-Tools Vulkan-ValidationLayers Vulkan-ValidationLayers-32bit \
                     glxinfo glxgears

