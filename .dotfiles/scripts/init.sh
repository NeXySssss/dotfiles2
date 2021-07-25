sudo xbps-install -S git

git clone --bare https://github.com/33kk/dotfiles $HOME/.dotfiles/git
git --bare --git-dir=$HOME/.dotfiles/git --work-tree=$HOME checkout

$HOME/.dotfiles/scripts/setup.sh
