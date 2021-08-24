#!/usr/bin/env sh

set -e
TMP="$(mktemp -d)"
cleanup() {
	rm -rf "$TMP"
}
trap cleanup EXIT TERM INT

FONTS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"/fonts/MaterialDesignIcons

if [ ! -d "$FONTS_DIR" ]; then
	mkdir -p "$FONTS_DIR"
fi

URL="https://github.com/Templarian/MaterialDesign-Webfont/archive/master.zip"

download_tmp_zip() {
	OUT_TMP="$(mktemp --tmpdir="$TMP" -d)"
	download_zip "$1" "$OUT_TMP"
}

download_zip() {
	ZIP_TMP="$(mktemp --tmpdir="$TMP" --suffix=.zip)"
	curl -sLo "$ZIP_TMP" "$1"
	unzip -qq -o "$ZIP_TMP" -d "$2"
	echo "$2"
}

TMP_FONT_DIR="$(download_tmp_zip "$URL")"

mv "$TMP_FONT_DIR"/*/fonts/*.ttf "$FONTS_DIR"

echo "$FONTS_DIR"
