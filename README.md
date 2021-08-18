# 33KK's Dotfiles

## Screenshots

![1](.dotfiles/screenshots/1.png)
![2](.dotfiles/screenshots/2.png)
![3](.dotfiles/screenshots/3.png)
![4](.dotfiles/screenshots/4.png)
![5](.dotfiles/screenshots/5.png)

## Details

### System

- **Distro**: void
- **Shell**: zsh
- **Sound server**: pipewire
- **Window manager**: bspwm
- **XDG autostart**: dex
- **Hotkey daemon**: sxhkd
- **Panel**: polybar
- **Compositor**: picom
- **Notifications daemon**: dunst
- **Lockscreen**: i3lock-color

### Apps

- **Terminal emulator**: kitty
- **Web browser**: firefox
- **File manager**: dolphin
- **Media players**: mpv, vlc
- **Image viewer**: gwenview

### Utils

- **Launcher**: rofi
- **Clipboard manager**: copyq
- **Color picker**: kcolorchooser
- **Emoji picker**: rofi-emoji
- **Volume control**: pavucontrol
- **Pipewire routing**: qjackctl
- **Qt5 settings**: qt5ct
- **Android integration**: kdeconnect

### CLI utils

- **Text editor**: neovim
- **System monitor**: htop
- **cat** -> bat
- **grep** -> rg
- **ls** -> exa
- **cd** -> zoxide

### Scripts
- **sens**: set mouse sensitivity
- **wp**: set wallpaper
- **xorg-layouts**: set xorg keyboard layouts
- **x-\***: default graphical apps

### Void stuff

- **OOM daemon**: earlyoom
- **NTP daemon**: chronyd

### Themes

- **Qt**: kvantum
- **GTK**: oomox
- nvim
- obs

### Other

- [Mouse sensitivity](.local/bin/sens)
- [Keybindings](.config/bspwm/sxhkdrc)
- [Keyboard layouts](.local/bin/xorg-layouts) + [polybar module](.config/polybar/modules/xkeyboard.ini)
- [Aliases](.config/sh/rc.d/alias)

## Todo

- Arch support
- VM drivers installation

## Usage

### Setup

Void Linux:

```bash
sudo xbps-install git
git clone --bare https://github.com/33kk/dotfiles ~/.dotfiles/git
git --bare --git-dir=~/.dotfiles/git --work-tree=~ checkout
~/.dotfiles/scripts/setup.sh
```

or 

```bash
sudo xbps-install curl
curl -L https://git.io/J4Lfc | sh -
~/.dotfiles/scripts/setup.sh
```

### Update

```bash
config pull
~/.dotfiles/scripts/setup.sh
```
