#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -Sy void-repo-nonfree
sudo xbps-install -Sy linux-firmware-amd
