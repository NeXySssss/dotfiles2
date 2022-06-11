#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

if grep "GenuineIntel" /proc/cpuinfo; then
	log_info "Setting up CPU"
	LOG_SIGN="$LOG_SIGN>" "$DIR"/cpu.sh || error "Failed to setup CPU"
fi

if lspci | grep -E "(3D|VGA).*Intel" >/dev/null 2>&1; then
	log_info "Setting up GPU"
	LOG_SIGN="$LOG_SIGN>" "$DIR"/gpu.sh || error "Failed to setup GPU"
fi
