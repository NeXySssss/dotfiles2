# vim: foldmethod=marker

# Snippets {{{
zcomet load ohmyzsh lib/git.zsh
zcomet load ohmyzsh lib/key-bindings.zsh
zcomet snippet https://raw.githubusercontent.com/zimfw/completion/master/init.zsh
# }}}

# Plugins {{{
zcomet load zsh-users/zsh-autosuggestions
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zdharma-continuum/history-search-multi-word
zcomet load zsh-users/zsh-completions
# zcomet load marlonrichert/zsh-autocomplete
# }}}

# Prompt {{{
zcomet load romkatv/powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
# }}}

# Zoxide {{{
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh)"
fi
# }}}


# Default completion
compdef _gnu_generic -default-
zcomet compinit
