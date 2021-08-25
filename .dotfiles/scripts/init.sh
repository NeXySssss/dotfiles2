#!/usr/bin/env sh
. /etc/os-release

export DISTRO="$ID"

case "$DISTRO" in
	void)
		sudo xbps-install -Sy git
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu git
	;;
esac

git clone --bare https://github.com/33kk/dotfiles "$HOME"/.dotfiles/git
git --bare --git-dir="$HOME"/.dotfiles/git --work-tree="$HOME" checkout
