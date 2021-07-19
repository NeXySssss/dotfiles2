# Completion
autoload -Uz compinit
compinit
zinit cdreplay -q
# Default completion
compdef _gnu_generic -default-

autoload zcalc
# Mass rename
autoload zmv

# History settings
HISTFILE=$ZDOTDIR/history
HISTSIZE=1000
SAVEHIST=1000
HISTCONTROL=ignorespace
setopt histignorespace

# Options
setopt autocd extendedglob nomatch autopushd pushdignoredups

# Default binds
bindkey -e
