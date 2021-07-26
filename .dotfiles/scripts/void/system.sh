#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

echo "=============================="
echo " Setting security limits"
echo "=============================="
LIMITS="$(whoami)	hard	nofile	524288"
if ! grep "$LIMITS" /etc/security/limits.conf; then
	echo "$LIMITS" | sudo tee -a /etc/security/limits.conf
fi

echo "=============================="
echo " Elogind KillUserProcesses=yes"
echo "=============================="
sudo sed -i 's|#KillUserProcesses=no|KillUserProcesses=yes|' /etc/elogind/logind.conf

sudo mkdir -p /etc/X11/xorg.conf.d

echo "=============================="
echo " Disabling mouse acceleration"
echo "=============================="
sudo cp "$DIR"/../../config/x11-mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
