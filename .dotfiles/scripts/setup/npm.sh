#!/usr/bin/env sh

echo "cache=${XDG_CACHE_HOME:-$HOME/.cache}/npm" > "${XDG_CONFIG_HOME:-$HOME/.config}"/npm/npmrc
{
	echo "tmp=/run/user/$(id -u)/npm"
	echo "init-module=${XDG_CONFIG_HOME:-$HOME/.config}/npm/config/npm-init.js"
	echo "store-dir=${XDG_DATA_HOME:-$HOME/.local/share}/pnpm-store"
} >> "${XDG_CONFIG_HOME:-$HOME/.config}"/npm/npmrc
