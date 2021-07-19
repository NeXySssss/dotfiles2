#!/usr/bin/env sh

sudo xbps-install -S noto-fonts-ttf noto-fonts-cjk

DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

$DIR/../fonts/codicons.sh
$DIR/../fonts/jetbrainsmono.sh
$DIR/../fonts/nerdfonts.sh JetBrainsMono

fc-cache
