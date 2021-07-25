#!/usr/bin/env sh

sudo xbps-install -S void-repo-multilib
sudo xbps-install -S pipewire pipewire-32bit libjack-pipewire libjack-pipewire-32bit alsa-pipewire alsa-pipewire-32bit rtkit
