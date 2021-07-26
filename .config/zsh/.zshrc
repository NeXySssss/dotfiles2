for file in "${XDG_CONFIG_HOME:-~/.config}"/sh/rc.d/**/*; do
	source "$file"
done

for file in "$ZDOTDIR"/rc.d/**/*.zsh; do
	source "$file"
done
