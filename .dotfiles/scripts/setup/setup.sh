#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../lib/log.sh

LOG_SIGN=">"

. /etc/os-release
export DISTRO="$ID"

case "$DISTRO" in
	void|arch) ;;
	*) error "Only Void and Arch Linux are currently supported" ;;
esac

log_info "Setting up base" 1
LOG_SIGN="$LOG_SIGN>" "$DIR"/base/setup.sh || error "Base setup failed"
log_info "Setting up Intel hardware" 1
LOG_SIGN="$LOG_SIGN>" "$DIR"/intel/setup.sh || error "Intel setup failed"
log_info "Setting up Nvidia hardware" 1
LOG_SIGN="$LOG_SIGN>" "$DIR"/nvidia/setup.sh || error "Nvidia setup failed"
log_info "Setting up AMD hardware" 1
LOG_SIGN="$LOG_SIGN>" "$DIR"/amd/setup.sh || error "Amd setup failed"
log_info "Setting up virtual hardware" 1
LOG_SIGN="$LOG_SIGN>" "$DIR"/vm/setup.sh || error "Vm setup failed"
log_info "Setting up xorg" 1
LOG_SIGN="$LOG_SIGN>" "$DIR"/xorg/setup.sh || error "Xorg setup failed"
log_info "Setting up bspwm" 1
LOG_SIGN="$LOG_SIGN>" "$DIR"/bspwm/setup.sh || error "Bspwm setup failed"
