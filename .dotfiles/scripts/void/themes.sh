#!/usr/bin/env sh

sudo xbps-install -S git papirus-icon-theme

TMP="$(mktemp -d)"
cd "$TMP"

git clone --single-branch --depth=1 "https://github.com/vinceliuice/Layan-cursors" "$TMP"

ICONS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/icons"

cp -r dist/ "$ICONS_DIR"/Layan-cursors
cp -r dist-border/ "$ICONS_DIR"/Layan-border-cursors
cp -r dist-white/ "$ICONS_DIR"/Layan-white-cursors

rm -rf "$TMP"

cd "$ICONS_DIR"

ln -s Layan-white-cursors default
