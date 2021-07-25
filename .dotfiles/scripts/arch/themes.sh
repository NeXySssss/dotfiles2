#!/usr/bin/env sh

sudo xbps-install -S git papirus-icon-theme

TMP=$(mktemp -d)
cd $TMP

git clone --single-branch --depth=1 "https://github.com/vinceliuice/Layan-cursors" "$TMP"

./install.sh

rm -rf "$TMP"
