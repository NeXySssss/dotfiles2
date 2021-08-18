#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -Sy git papirus-icon-theme

TMP="$(mktemp -d)"
cd "$TMP"

git clone --single-branch --depth=1 "https://github.com/vinceliuice/Layan-cursors" "$TMP"

ICONS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/icons"

if [ ! -d "$ICONS_DIR" ]; then
	mkdir -p "$ICONS_DIR"
fi

cp -r dist/ "$ICONS_DIR"/Layan-cursors
cp -r dist-border/ "$ICONS_DIR"/Layan-border-cursors
cp -r dist-white/ "$ICONS_DIR"/Layan-white-cursors

rm -rf "$TMP"

cd "$ICONS_DIR"

ln -s Layan-white-cursors default
