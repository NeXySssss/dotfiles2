#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

sudo xbps-install -S curl jq unzip noto-fonts-ttf noto-fonts-cjk

"$DIR"/../../fonts/codicons.sh
"$DIR"/../../fonts/jetbrainsmono.sh
"$DIR"/../../fonts/nerdfonts.sh JetBrainsMono

fc-cache
