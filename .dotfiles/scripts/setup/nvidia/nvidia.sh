#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -S nvidia nvidia-libs nvidia-libs-32bit linux-firmware-nvidia \
                     vulkan-loader vulkan-loader-32bit vulkan-tools vulkan-validationlayers vulkan-validationlayers-32bit \
                     glxinfo mesa-demos
