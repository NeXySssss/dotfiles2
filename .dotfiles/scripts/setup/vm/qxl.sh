#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S void-repo-multilib
sudo xbps-install -S xf86-video-qxl xf86-video-qxl-32bit
