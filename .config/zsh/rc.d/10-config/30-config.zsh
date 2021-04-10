# Completion
autoload -Uz compinit
compinit
zinit cdreplay -q

autoload zcalc
# Mass rename
autoload zmv

# Default autocompletion
compdef _gnu_generic -default-

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
