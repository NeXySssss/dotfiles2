#!/usr/bin/env sh

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -S nvidia nvidia-libs nvidia-libs-32bit linux-firmware-nvidia \
                     vulkan-loader vulkan-loader-32bit Vulkan-Tools Vulkan-ValidationLayers Vulkan-ValidationLayers-32bit \
                     glxinfo glxgears
