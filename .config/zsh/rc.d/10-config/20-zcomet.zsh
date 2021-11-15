# Clone zcomet if necessary
local zcomet="${ZDOTDIR:-$HOME}"/.zcomet/bin
if [[ ! -f "$zcomet"/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git "$zcomet"
fi

source "$zcomet"/zcomet.zsh
