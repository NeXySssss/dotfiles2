alias cd=z

ghcl() { git clone "https://github.com/$*"; }
ytp() { vlc "$(youtube-dl -g "$*")"; }
jc() { jq "." "$*" | bat --file-name "$*"; }

# Clear command history
alias clh="function erase_history { local HISTSIZE=0; } && erase_history && rm $HISTFILE"
alias clhe="rm $HISTFILE && exit"

if [ -x "$(command -v thefuck)" ]; then
  eval "$(thefuck --alias)"
fi
