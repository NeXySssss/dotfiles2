#!/usr/bin/env sh

set -e

FONTS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts/JoyPixels"

if [ ! -d "$FONTS_DIR" ]; then
	mkdir -p "$FONTS_DIR"
fi

curl -sLo "$FONTS_DIR"/joypixels-6_6_0.ttf "https://cdn.joypixels.com/arch-linux/font/6.6.0/joypixels-android.ttf"

echo "$FONTS_DIR"
