#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

"$DIR"/setup/setup.sh 2>&1 | tee "$HOME"/setup.log
