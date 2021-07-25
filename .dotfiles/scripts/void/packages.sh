#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S dex bspwm sxhkd polybar dunst rofi i3lock-color yad \
                     base-devel elogind chrony udisks2 eudev dbus-elogind dbus-elogind-libs dbus-elogind-x11 \
                     xdg-desktop-portal xdg-desktop-portal-kde xdg-user-dirs xdg-utils \
                     playerctl light numlockx lxqt-policykit picom wmname redshift redshift-gtk \
                     zsh zoxide git bat ripgrep exa neovim htop jq curl aria2 unzip neofetch \
                     kitty firefox vlc mpv CopyQ ark dolphin gwenview kdeconnect \
                     qjackctl pamixer pavucontrol \
                     xorg-minimal sx xclip xsel xsetroot xprop setxkbmap \
                     hsetroot kvantum qt5ct papirus-icon-theme

case "$SHELL" in
	*zsh*) ;;
                     *) chsh -s /usr/bin/zsh ;;
esac

ln -s /etc/sv/dbus /var/service
ln -s /etc/sv/chronyd /var/service
ln -s /etc/sv/elogind /var/service

echo "=============================="
echo " Installing custom packages"
echo "=============================="
$DIR/custom-packages.sh
