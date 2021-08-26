#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

if ! command -v paru; then
	TMP=$(mktemp -d)
	git clone https://aur.archlinux.org/paru.git "$TMP"
	cd "$TMP"
	makepkg -si
fi

if ! grep -E "^MAKEFLAGS" /etc/makepkg.conf; then
	if grep -E "^#MAKEFLAGS" /etc/makepkg.conf; then
		sudo sed -iE 's|^#MAKEFLAGS.*$|MAKEFLAGS="-j'"$(nproc)"'"|' /etc/makepkg.conf
	else
		echo "MAKEFLAGS=\"-j$(nproc)\"" | sudo tee -a /etc/makepkg.conf
	fi
fi
