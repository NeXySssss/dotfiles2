#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

if ! command -v paru; then
	log_info "Cloning package"
	TMP=$(mktemp -d)
	git clone https://aur.archlinux.org/paru.git "$TMP" || error "Failed to clone package"
	cd "$TMP"
	log_info "Building package"
	makepkg --needed --noconfirm -si|| error "Failed to build package"
	rm -rf "$TMP" || error "Failed to delete package directory"
fi

if ! grep -E "^MAKEFLAGS" /etc/makepkg.conf; then
	log_info "Setting MAKEFLAGS"

	if grep -E "^#MAKEFLAGS" /etc/makepkg.conf; then
		sudo sed -iE 's|^#MAKEFLAGS.*$|MAKEFLAGS="-j'"$(nproc)"'"|' /etc/makepkg.conf || error "Failed to set MAKEFLAGS"
	else
		echo "MAKEFLAGS=\"-j$(nproc)\"" | sudo tee -a /etc/makepkg.conf || error "Failed to set MAKEFLAGS"
	fi
fi
