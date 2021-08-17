#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

if grep "AuthenticAMD" /proc/cpuinfo; then
	"$DIR"/cpu.sh
fi

if lspci | grep -E "(3D|VGA).*Advanced Micro Devices" >/dev/null 2>&1; then
	"$DIR"/gpu.sh
fi
