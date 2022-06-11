#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

if [ ! -d "${XDG_CONFIG_HOME:-$HOME/.config}"/npm ]; then
	log_info "Creating npm configuration"

	mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}"/npm

	echo "cache=${XDG_CACHE_HOME:-$HOME/.cache}/npm" > "${XDG_CONFIG_HOME:-$HOME/.config}"/npm/npmrc
	{
		echo "tmp=/run/user/$(id -u)/npm"
		echo "init-module=${XDG_CONFIG_HOME:-$HOME/.config}/npm/config/npm-init.js"
		echo "store-dir=${XDG_DATA_HOME:-$HOME/.local/share}/pnpm-store"
	} >> "${XDG_CONFIG_HOME:-$HOME/.config}"/npm/npmrc
fi
