#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy curl jq unzip noto-fonts-ttf noto-fonts-cjk
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu curl jq unzip noto-fonts noto-fonts-cjk
	;;
esac

"$DIR"/../../fonts/codicons.sh
"$DIR"/../../fonts/fontawesome.sh
"$DIR"/../../fonts/materialdesignicons.sh
"$DIR"/../../fonts/joypixels.sh
"$DIR"/../../fonts/jetbrainsmono.sh
"$DIR"/../../fonts/nerdfonts.sh JetBrainsMono

fc-cache
