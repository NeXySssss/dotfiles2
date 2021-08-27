#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
case "$DISTRO" in
	void)
		sudo xbps-install -Sy curl jq unzip noto-fonts-ttf noto-fonts-cjk || error "Failed to install packages"
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu curl jq unzip noto-fonts noto-fonts-cjk || error "Failed to install packages"
	;;
esac

log_info "Installing Codicons"
LOG_SIGN="$LOG_SIGN>" "$DIR"/../../fonts/codicons.sh || error "Failed to install Codicons"
log_info "Installing FontAwesome"
LOG_SIGN="$LOG_SIGN>" "$DIR"/../../fonts/fontawesome.sh || error "Failed to install FontAwesome"
log_info "Installing Material Design Icons"
LOG_SIGN="$LOG_SIGN>" "$DIR"/../../fonts/materialdesignicons.sh || error "Failed to install Material Design Icons"
log_info "Installing JoyPixels"
LOG_SIGN="$LOG_SIGN>" "$DIR"/../../fonts/joypixels.sh || error "Failed to install JoyPixels"
log_info "Installing JetBrainsMono"
LOG_SIGN="$LOG_SIGN>" "$DIR"/../../fonts/jetbrainsmono.sh || error "Failed to install JetBrainsMono"
log_info "Installing NerdFonts"
LOG_SIGN="$LOG_SIGN>" "$DIR"/../../fonts/nerdfonts.sh JetBrainsMono || error "Failed to install NerdFonts"

fc-cache || error "Failed to build font cache"
