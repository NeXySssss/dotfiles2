#!/usr/bin/sh

log_err() {
	printf " ${LOG_SIGN:->} \033[38;5;9m%s\033[m\n" "$1" >&2
}

log_warn() {
	printf " ${LOG_SIGN:->} \033[38;5;11m%s\033[m\n" "$1" >&2
}

log_info() {
	if [ "$2" ]; then
		printf "\n ${LOG_SIGN:->} \033[38;5;12m%s\033[m\n\n" "$1"
	else
		printf " ${LOG_SIGN:->} \033[38;5;12m%s\033[m\n" "$1"
	fi
}

error() {
	log_err "$1"
	exit 1
}
