# 33KK's Dotfiles

## Screenshots

![1](.dotfiles/screenshots/1.png)
![2](.dotfiles/screenshots/2.png)
![3](.dotfiles/screenshots/3.png)
![4](.dotfiles/screenshots/4.png)
![5](.dotfiles/screenshots/5.png)
![6](.dotfiles/screenshots/6.png)
![7](.dotfiles/screenshots/7.png)
![8](.dotfiles/screenshots/8.png)
![9](.dotfiles/screenshots/9.png)

## Details

- To set mouse sensitivity use `sens` script
- To change keyboard layouts edit `.local/bin/xorg-layouts` and add icon in `.config/polybar/modules/xkeyboard.ini`
- To persist monitor configuration put your xrandr command in `.local/bin/xorg-setup-display`
- View and edit keybindings in `.config/bspwm/sxhkdrc`
- View and edit aliases in `.config/sh/rc.d/alias`

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

### Software

- **Launcher**: rofi
- **Terminal emulator**: kitty
- **Web browser**: firefox
- **File manager**: dolphin
- **Media players**: mpv, vlc
- **Image viewer**: gwenview
- **Calculator**: qalculate-gtk
- **Color picker**: kcolorchooser
- **Emoji picker**: rofi-emoji
- **Clipboard manager**: copyq
- **Android integration**: kdeconnect
- **Volume control**: pavucontrol
- **Pipewire routing**: qjackctl
- **Qt5 settings**: qt5ct

#### CLI

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
- **xorg-setup-display**: setup xorg display
- **x-\***: default graphical apps

### Themes

- **Qt**: kvantum
- **GTK**: oomox
- **nvim**: [kkDark](https://github.com/33kk/kkDark)
- **obs**

### Void

- **OOM daemon**: earlyoom
- **NTP daemon**: chronyd

## Usage

### Setup

**Nvidia DKMS driver requires kernel headers**

On a clean Void Linux system:
```bash
sudo xbps-install -S git
git clone --bare https://github.com/33kk/dotfiles ~/.dotfiles/git
git --bare --git-dir="$HOME"/.dotfiles/git --work-tree="$HOME" checkout
~/.dotfiles/scripts/setup.sh
```

On a clean Arch Linux system:
```bash
sudo pacman -Syu git
git clone --bare https://github.com/33kk/dotfiles ~/.dotfiles/git
git --bare --git-dir="$HOME"/.dotfiles/git --work-tree="$HOME" checkout
~/.dotfiles/scripts/setup.sh
```

### Update

```bash
config pull
~/.dotfiles/scripts/setup.sh
```
