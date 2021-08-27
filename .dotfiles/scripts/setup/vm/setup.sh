#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

if lspci | grep -E "(3D|VGA).*Qxl" >/dev/null 2>&1; then
	log_info "Setting up QXL graphics"
	LOG_SIGN="$LOG_SIGN>" "$DIR"/qxl.sh || error "Failed to setup qxl"
fi

if lspci | grep -E "(3D|VGA).*VMware" >/dev/null 2>&1; then
	log_info "Setting up VMWare graphics"
	LOG_SIGN="$LOG_SIGN>" "$DIR"/vmware.sh || error "Failed to setup vmware"
fi
