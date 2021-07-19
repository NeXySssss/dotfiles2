#!/usr/bin/env sh

set -e
TMP="$(mktemp -d)"
cleanup() {
	rm -rf "$TMP"
}
trap cleanup EXIT TERM INT

FONTS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts/NerdFonts"

if [ ! -d "$FONTS_DIR" ]; then
	mkdir -p "$FONTS_DIR"
fi

JSON=$(curl -sL "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest")

get_download_url() {
	printf "%s" "$JSON" | jq -r '.assets[] | select (.name == "'$1'.zip") | .browser_download_url'
}

download_zip() {
	ZIP_TMP="$(mktemp --tmpdir="$TMP" --suffix=.zip)"
	curl -sLo "$ZIP_TMP" "$1"
	unzip -qq -o "$ZIP_TMP" -d "$2"
	echo "$2"
}

while :; do
	if [ "$1" != "" ]; then
		download_zip "$(get_download_url "$1")" "$FONTS_DIR/$1"
		shift
	else
		break
	fi
done
