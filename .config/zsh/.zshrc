# Function to determine the need of a zcompile. If the .zwc file
# does not exist, or the base file is newer, we need to compile.
zcompare() {
  if [[ -s ${1} && ( ! -s ${1}.zwc || ${1} -nt ${1}.zwc) ]]; then
    zcompile ${1}
  fi
}

zcompare "$ZDOTDIR"/.zshrc
if [ -f ""$ZDOTDIR"/.p10k.zsh" ]; then
	zcompare "$ZDOTDIR"/.p10k.zsh
fi

for file in "${XDG_CONFIG_HOME:-~/.config}"/sh/rc.d/**/*; do
	source "$file"
done; unset file

for file in "$ZDOTDIR"/rc.d/**/*.zsh; do
	zcompare "$file"
	source "$file"
done; unset file
