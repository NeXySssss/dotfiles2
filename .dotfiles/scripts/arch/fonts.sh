#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S noto-fonts-ttf noto-fonts-cjk

echo "=============================="
echo " Installing codicons"
echo "=============================="
$DIR/../fonts/codicons.sh
echo "=============================="
echo " Installing JetBrainsMono"
echo "=============================="
$DIR/../fonts/jetbrainsmono.sh
echo "=============================="
echo " Installing NerdFonts"
echo "=============================="
$DIR/../fonts/nerdfonts.sh JetBrainsMono

fc-cache
