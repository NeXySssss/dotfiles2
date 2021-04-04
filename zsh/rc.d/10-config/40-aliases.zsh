# vim: foldmethod=marker

# Pacman {{{
alias pacman="sudo pacman --color auto"
alias pcsyu="sudo pacman -Syu"
alias pcs="sudo pacman -S"
alias pcrns="sudo pacman -Rns"
alias pcudb="sudo rm /var/lib/pacman/db.lck"
alias yay="paru"
alias p="paru"
# }}}

# Replace programs with alternatives {{{
alias a="exa -a"
alias l="exa -l"
alias la="exa -la"
alias ls="exa"
alias cat="bat"
alias grep="rg"
alias nano="nvim"
alias vim="nvim"
alias vi="nvim"
# }}}

# Add default options {{{
alias mkdir="mkdir -pv"
alias neofetch="neofetch | lolcat"
alias cfetch="clear && neofetch | lolcat"
alias ping="ping -c 5"
alias qmv="qmv -f do"
# }}}

# Shorten long commands {{{
alias t="touch"
alias h="history"
alias j="jobs -l"
alias c="clear"
alias x="exit"
alias q="exit"
alias sl="streamlink"
alias ytd="youtube-dl"
alias icat="kitty +kitten icat"
alias v="nvim"
alias r="ranger"
alias nextbg="~/Scripts/wall.sh"
alias vpn="sudo openvpn --config $HOME/Documents/zaborona.ovpn"
ghcl() { git clone "https://github.com/$@" }
ytp() { vlc `youtube-dl -g $@` }
jc() { cat $@ | jq | bat --file-name $@ }
# }}}

# Clear command history {{{
alias clear="printf \\\ec"

alias clh="function erase_history { local HISTSIZE=0; } && erase_history && rm $HISTFILE"
alias clhe="rm $HISTFILE && exit"

# Get currently used gpu
alias gpu="glxinfo | grep 'OpenGL renderer' | sed 's/.*: //'"

# Alt+shift to toggle keyboard layouts
alias kbbind="setxkbmap -model pc105 -layout us,ru,ua -variant qwerty -option grp:alt_shift_toggle"

# thefuck
if [ -x "$(command -v thefuck)" ]; then
  eval $(thefuck --alias)
fi

# Delete all node_modules in cwd
alias rmnode="rm -rf ./**/node_modules"

# Dotfiles git bare repo
alias config='/usr/bin/git --git-dir=/home/marko/.cfg/ --work-tree=/home/marko'
# }}}
