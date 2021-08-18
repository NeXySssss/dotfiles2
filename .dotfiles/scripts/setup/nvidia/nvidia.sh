#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -S linux-firmware-nvidia nvidia nvidia-libs nvidia-libs-32bit
