# vim: foldmethod=marker

# Snippets {{{
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet https://github.com/zimfw/completion/raw/master/init.zsh
# }}}

# Plugins {{{
zinit ice depth=1
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1
zinit light zdharma/fast-syntax-highlighting
zinit ice depth=1
zinit load zdharma/history-search-multi-word
zinit ice depth=1
zinit light zsh-users/zsh-completions
# }}}

# Prompt {{{
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
# }}}

# Zoxide {{{
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh)"
fi
# }}}
