#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

if grep "GenuineIntel" /proc/cpuinfo; then
	"$DIR"/ucode.sh
fi

if lspci | grep -E "(3D|VGA).*Intel" >/dev/null 2>&1; then
	"$DIR"/gpu.sh
fi
