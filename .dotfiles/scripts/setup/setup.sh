#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

. /etc/os-release
export DISTRO="$ID"

[ "$DISTRO" != "void" ] && echo Only Void Linux is currently supported && exit 1

"$DIR"/base/setup.sh
"$DIR"/intel/setup.sh
"$DIR"/nvidia/setup.sh
"$DIR"/amd/setup.sh
"$DIR"/vm/setup.sh
"$DIR"/xorg/setup.sh
"$DIR"/bspwm/setup.sh
"$DIR"/npm.sh
