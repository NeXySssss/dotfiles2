# vim: foldmethod=marker

# Snippets{{{

zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet http://github.com/zimfw/completion/raw/master/init.zsh
#zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

# }}}

# Plugins{{{

zinit ice depth=1
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1
zinit light zdharma/fast-syntax-highlighting
zinit ice depth=1
zinit load zdharma/history-search-multi-word
zinit ice depth=1
zinit light zsh-users/zsh-completions
zinit ice depth=1
zinit light chrissicool/zsh-256color
zinit ice depth=1
zinit light momo-lab/zsh-abbrev-alias
zinit ice depth=1
zinit light momo-lab/zsh-replace-multiple-dots
# zinit ice depth=1
# zinit light skywind3000/z.lua
#zinit ice depth=1
#zinit light RobSis/zsh-completion-generator

# }}}

# Prompt{{{

zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
#zinit light denysdovhan/spaceship-prompt

# }}}

# Zoxide{{{
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh)"
fi
# }}}
