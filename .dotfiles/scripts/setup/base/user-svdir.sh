#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

USER="$(id -u -n)"

if [ ! -d "${XDG_DATA_HOME:-$HOME/.local/share}"/service ]; then
	mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/service || error "Failed to create services directory"
fi

if [ ! -d /etc/sv/runsvdir-"$USER" ]; then
	sudo mkdir -p /etc/sv/runsvdir-"$USER" || error "Failed to create service directory"
	sudo cp "$DIR"/user-svdir-service /etc/sv/runsvdir-"$USER"/run || error "Failed to copy service run script"
	sudo sed -i "s|<username>|$USER|" /etc/sv/runsvdir-"$USER"/run || error "Failed to replace placeholders in service run file"
	sudo ln -s /etc/sv/runsvdir-"$USER" /var/service || error "Failed to enable service"
fi
