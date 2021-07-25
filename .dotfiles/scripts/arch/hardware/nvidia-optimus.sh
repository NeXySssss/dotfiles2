#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp $DIR/../../../config/x11-nvidia-optimus.conf /etc/X11/xorg.conf.d/10-nvidia-optimus.conf
sudo cp $DIR/../../../config/dracut-nvidia-drm.conf /etc/dracut.conf.d/10-nvidia-drm.conf

sudo dracut -f
