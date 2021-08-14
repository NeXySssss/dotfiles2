for file in "${XDG_CONFIG_HOME:-~/.config}"/sh/rc.d/**/* "$ZDOTDIR"/rc.d/**/*.zsh; do
	source "$file"
done; unset file
