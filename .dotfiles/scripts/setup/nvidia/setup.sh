#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

if lspci | grep -E "(3D|VGA).*NVIDIA" >/dev/null 2>&1; then
	"$DIR"/nvidia.sh
fi

if lspci | grep -E "VGA.*Intel" >/dev/null 2>&1 && lspci | grep -E "3D.*NVIDIA" >/dev/null 2>&1; then
	"$DIR"/optimus.sh
fi
