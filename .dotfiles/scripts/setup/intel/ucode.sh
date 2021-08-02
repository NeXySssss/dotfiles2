#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S void-repo-nonfree
sudo xbps-install -S linux-firmware-intel intel-ucode
