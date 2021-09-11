#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )
. "$DIR"/../../lib/log.sh

log_info "Installing packages"
case "$DISTRO" in
	void)
		sudo xbps-install -Sy base-devel elogind chrony udisks2 eudev earlyoom \
			zsh zoxide git bat ripgrep exa neovim htop jq perl python3 curl aria2 unzip neofetch \
			dbus-elogind dbus-elogind-libs dbus-elogind-x11 \
			xdg-user-dirs xdg-utils || error "Failed to install packages"
	;;
	arch)
		sudo pacman --needed --noconfirm  -Syu base-devel udisks2 earlyoom \
			zsh zoxide git bat ripgrep exa neovim htop jq perl python curl aria2 unzip neofetch \
			xdg-user-dirs xdg-utils || error "Failed to install packages"

		sudo sed -i "s|#ParallelDownloads = .*|ParallelDownloads = 10|" /etc/pacman.conf || error "Failed to set pacman parallel downloads"
		sudo perl -i -p0e 's|#\[multilib\]\n#I|[multilib]\nI|' /etc/pacman.conf
		if ! grep -E '^\[multilib\]' /etc/pacman.conf; then
			error "Failed to enable multilib"
			exit 1
		fi
	;;
esac

log_info "Changing user shell"
case "$SHELL" in
	*zsh*) ;;
	*) sudo chsh -s /usr/bin/zsh "$(id -u -n)" || error "Failed to change shell" ;;
esac

log_info "Configuring"
case "$DISTRO" in
	void)
		LIMITS="$(id -u -n)	hard	nofile	524288"
		if ! grep "$LIMITS" /etc/security/limits.conf; then
			echo "$LIMITS" | sudo tee -a /etc/security/limits.conf || error "Failed to set limits"
		fi
		
		sudo sed -i "s|#KillUserProcesses=no|KillUserProcesses=yes|" /etc/elogind/logind.conf || error "Failed to edit elogind config"
		sudo cp "$DIR"/earlyoom.conf /etc/sv/earlyoom/conf || error "Failed to set earlyoom config"
		
		sudo ln -s /etc/sv/dbus /var/service || log_warn "Failed to enable dbus"
		sudo ln -s /etc/sv/chronyd /var/service || log_warn "Failed to enable chronyd"
		sudo ln -s /etc/sv/elogind /var/service || log_warn "Failed to enable elogind"
		sudo ln -s /etc/sv/earlyoom /var/service || log_warn "Failed to enable earlyoom"

		log_info "Creating a user svdir"
		LOG_SIGN="$LOG_SIGN>" "$DIR"/user-svdir.sh || error "Failed to create user svdir"
	;;
	arch)
		sudo cp "$DIR"/earlyoom.conf /etc/default/earlyoom || error "Failed to set earlyoom config"

		sudo systemctl enable --now earlyoom || error "Failed to enable earlyoom"

		log_info "Installing paru"
		LOG_SIGN="$LOG_SIGN>" "$DIR"/paru.sh || error "Failed to install paru"
	;;
esac

log_info "Configuring npm"
"$DIR"/npm.sh
log_info "Configuring neofetch"
"$DIR"/neofetch.sh
