zn() {
	if [ -d "$*" ]; then
		zoxide add "$*"
		nvim "$*"
	else
		match="$(zoxide query "$*")"
		if [ "$match" != "" ]; then
			nvim "$match"
		else
			echo zn: directory not found
		fi
	fi
}

alias zv=zn
