# 33KK's Dotfiles

## Contents

- sx
- dex
- bspwm
- sxhkd
- picom
- polybar
- dunst
- rofi
- i3lock-color
- mpv
- kitty
- zsh
- zoxide
- neovim
  - lua config
- themes
  - nvim
  - kvantum
  - gtk
  - obs-studio

## Setup

Void Linux:

```bash
sudo xbps-install -S git

git clone --bare https://github.com/33kk/dotfiles $HOME/.dotfiles/git
git --bare --git-dir=$HOME/.dotfiles/git --work-tree=$HOME checkout

$HOME/.dotfiles/scripts/setup.sh
```

or 

```bash
curl -L https://git.io/J4Lfc | sh -
~/.dotfiles/scripts/setup.sh
```

## Screenshots

![1](.dotfiles/screenshots/1.png)
![2](.dotfiles/screenshots/2.png)
![3](.dotfiles/screenshots/3.png)
![4](.dotfiles/screenshots/4.png)
![5](.dotfiles/screenshots/5.png)
