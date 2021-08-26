#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

USER="$(id -u -n)"

mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/service
sudo mkdir -p /etc/sv/runsvdir-"$USER"
sudo cp "$DIR"/user-svdir-service /etc/sv/runsvdir-"$USER"/run
sudo sed -i "s|<username>|$USER|" /etc/sv/runsvdir-"$USER"/run
sudo ln -s /etc/sv/runsvdir-"$USER" /var/service
