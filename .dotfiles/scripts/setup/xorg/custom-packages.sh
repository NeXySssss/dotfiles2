#!/usr/bin/env sh
sudo xbps-install -S git xtools xdg-user-dirs xdg-utils

DIR="${XDG_DOCUMENTS_DIR:-$(xdg-user-dir DOCUMENTS)}"/void-packages

git clone --branch my-pkgs --single-branch --depth=1 --recurse-submodules "https://github.com/33kk/void-packages" "$DIR"
cd "$DIR" || exit

./xbps-src binary-bootstrap

echo "XBPS_MAKEJOBS=$(nproc)" > etc/conf
echo "XBPS_ALLOW_RESTRICTED=yes" >> etc/conf

if ! xi picom; then
	./xbps-src pkg picom
fi

if ! xi flameshot-33kk; then
	./xbps-src pkg flameshot-33kk
fi

xi picom flameshot-33kk
