#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

if lspci | grep -E "(3D|VGA).*Qxl" >/dev/null 2>&1; then
	"$DIR"/qxl.sh
fi

if lspci | grep -E "(3D|VGA).*VMware" >/dev/null 2>&1; then
	"$DIR"/vmware.sh
fi
