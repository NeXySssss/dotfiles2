#!/bin/bash
zn() {
	if [ -d "$*" ]; then
		zoxide add "$*"
		nvim "$*"
		return "$?"
	else
		match="$(zoxide query "$@")"
		if [ "$match" != "" ]; then
			zoxide add "$match"
			nvim "$match"
			return "$?"
		fi
	fi
	
	return 1
}

alias zv=zn
