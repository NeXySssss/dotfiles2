#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
sudo xbps-install -Sy git xtools xdg-user-dirs xdg-utils || error "Failed to install packages"

xdg-user-dirs-update

PKGS_DIR="${XDG_DOCUMENTS_PKGS_DIR:-$(xdg-user-dir DOCUMENTS)}"/void-packages

if [ ! -d "$PKGS_DIR" ]; then
	log_info "Cloning the repo"
	git clone --branch my-pkgs --single-branch --depth=1 --recurse-submodules "https://github.com/33kk/void-packages" "$PKGS_DIR" || error "Failed to clone repo"
fi
cd "$PKGS_DIR"

log_info "Bootstrapping"
./xbps-src binary-bootstrap || error "Failed to bootstrap"

echo "XBPS_MAKEJOBS=$(nproc)" > etc/conf
echo "XBPS_ALLOW_RESTRICTED=yes" >> etc/conf

if ! xi picom-8.3_1; then
	log_info "Building picom"
	./xbps-src pkg picom || error "Failed to build picom"
fi

if ! xi flameshot-33kk; then
	log_info "Building flameshot-33kk"
	./xbps-src pkg flameshot-33kk || error "Failed to build flameshot-33kk"
fi

log_info "Installing custom packages"
xi picom flameshot-33kk || error "Failed to install custom packages"
