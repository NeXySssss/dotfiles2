fpath+=$ZDOTDIR/completions

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
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignorespace
setopt histignorespace

# Options
setopt autocd extendedglob nomatch autopushd pushdignoredups

# Default binds
bindkey -e
