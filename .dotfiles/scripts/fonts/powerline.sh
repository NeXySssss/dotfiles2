#!/usr/bin/env sh

set -e

FONTS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts/Powerline"

if [ ! -d "$FONTS_DIR" ]; then
	mkdir -p "$FONTS_DIR"
fi

curl -sLo "$FONTS_DIR"/powerline.otf "https://raw.githubusercontent.com/powerline/powerline/develop/font/PowerlineSymbols.otf"

echo "$FONTS_DIR"
