sudo xbps-install -S papirus-icon-theme

TMP=$(mktemp -d)
cd $TMP

git clone "https://github.com/vinceliuice/Layan-cursors" "$TMP"

./install.sh

rm -rf "$TMP"
