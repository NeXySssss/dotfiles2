#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

if lspci | grep -E "(3D|VGA).*NVIDIA" >/dev/null 2>&1; then
	log_info "Setting up GPU"
	LOG_SIGN="$LOG_SIGN>" "$DIR"/nvidia.sh || error "Failed to setup GPU"
fi

if lspci | grep -E "VGA.*Intel" >/dev/null 2>&1 && lspci | grep -E "3D.*NVIDIA" >/dev/null 2>&1; then
	log_info "Setting up Nvidia Optimus"
	LOG_SIGN="$LOG_SIGN>" "$DIR"/optimus.sh || error "Failed to setup Nvidia Optimus"
fi
