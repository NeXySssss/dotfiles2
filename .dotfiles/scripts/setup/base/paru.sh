#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

if ! command -v paru; then
	TMP=$(mktemp -d)
	git clone https://aur.archlinux.org/paru.git "$TMP"
	cd "$TMP"
	makepkg -si
fi
