#!/usr/bin/env sh
sudo xbps-install -Sy git

git clone --bare https://github.com/33kk/dotfiles "$HOME"/.dotfiles/git
git --bare --git-dir="$HOME"/.dotfiles/git --work-tree="$HOME" checkout
