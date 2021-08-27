#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

ICONS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/icons"

if [ ! -d "$ICONS_DIR"/Layan-white-cursors ]; then
	log_info "Installing layan cursors"
	TMP="$(mktemp -d)"
	cd "$TMP"
	
	git clone --single-branch --depth=1 "https://github.com/vinceliuice/Layan-cursors" "$TMP" || error "Failed to clone layan cursors repo"
	
	if [ ! -d "$ICONS_DIR" ]; then
		mkdir -p "$ICONS_DIR" || error "Failed to make directory"
	fi
	
	cp -r dist/ "$ICONS_DIR"/Layan-cursors || error "Failed to install layan cursors"
	cp -r dist-border/ "$ICONS_DIR"/Layan-border-cursors || error "Failed to install layan border cursors"
	cp -r dist-white/ "$ICONS_DIR"/Layan-white-cursors || error "Failed to install layan white cursors"
	
	rm -rf "$TMP" || error "Failed to clone repo"
	
	cd "$ICONS_DIR"
	
	ln -s Layan-white-cursors default || error "Failed to set default cursor theme"
fi
