#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

case "$DISTRO" in
	void)
		sudo xbps-install -Sy base-devel elogind chrony udisks2 eudev earlyoom \
		                     zsh zoxide git bat ripgrep exa neovim htop jq perl curl aria2 unzip neofetch \
		                     xdg-user-dirs xdg-utils
	;;
	arch)
		sudo perl -i -p0e 's|^#\[multilib\]\n#I|[multilib]\nI|' /etc/pacman.conf
		sudo pacman -Syu base-devel udisks2 earlyoom \
		                 zsh zoxide git bat ripgrep exa neovim htop jq perl curl aria2 unzip neofetch \
		                 xdg-user-dirs xdg-utils
	;;
esac


case "$SHELL" in
	*zsh*) ;;
	*) chsh -s /usr/bin/zsh ;;
esac

case "$DISTRO" in
	void)
		LIMITS="$(whoami)	hard	nofile	524288"
		if ! grep "$LIMITS" /etc/security/limits.conf; then
			echo "$LIMITS" | sudo tee -a /etc/security/limits.conf
		fi
		
		sudo sed -i "s|#KillUserProcesses=no|KillUserProcesses=yes|" /etc/elogind/logind.conf
		sudo cp "$DIR"/earlyoom.conf /etc/sv/earlyoom/conf
		
		sudo ln -s /etc/sv/dbus /var/service
		sudo ln -s /etc/sv/chronyd /var/service
		sudo ln -s /etc/sv/elogind /var/service
		sudo ln -s /etc/sv/earlyoom /var/service
	;;
	arch)
		sudo cp "$DIR"/earlyoom.conf /etc/default/earlyoom

		sudo systemctl enable --now earlyoom

		"$DIR"/paru.sh
	;;
esac


