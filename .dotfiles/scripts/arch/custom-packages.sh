#!/usr/bin/env sh
DIR="${XDG_DOCUMENTS_DIR:=$HOME/Documents}/void-packages"

echo "=============================="
echo " Installing custom packages"
echo "=============================="

sudo xbps-install -S git xtools

git clone --single-branch --depth=1 --recurse-submodules "https://github.com/33kk/void-packages" "$DIR"
cd "$DIR"

echo "XBPS_MAKEJOBS=$(nproc)" > etc/conf

if ! xi picom; then
	./xbps-src pkg picom
fi

if ! xi flameshot-33kk; then
	./xbps-src pkg flameshot-33kk
fi

xi picom flameshot-33kk
