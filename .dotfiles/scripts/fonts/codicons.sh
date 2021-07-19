#!/usr/bin/env sh

set -e

FONTS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts/Codicons"

if [ ! -d "$FONTS_DIR" ]; then
	mkdir -p "$FONTS_DIR"
fi

curl -sLo "$FONTS_DIR"/codicon.ttf "https://raw.githubusercontent.com/microsoft/vscode-codicons/main/dist/codicon.ttf"

echo "$FONTS_DIR"
