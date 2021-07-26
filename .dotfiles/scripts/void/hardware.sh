#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

echo "=============================="
echo " Installing pipewire"
echo "=============================="
"$DIR"/hardware/pipewire.sh

if grep "GenuineIntel" /proc/cpuinfo; then
	echo "=============================="
	echo " Installing Intel microcode"
	echo "=============================="
	"$DIR"/hardware/intel-ucode.sh
fi

if lspci | grep -E "(3D|VGA).*NVIDIA" >/dev/null 2>&1; then
	echo "=============================="
	echo " Installing NVIDIA GPU driver"
	echo "=============================="
	"$DIR"/hardware/nvidia.sh
fi

if lspci | grep -E "(3D|VGA).*Intel" >/dev/null 2>&1; then
	echo "=============================="
	echo " Installing Intel iGPU driver"
	echo "=============================="
	"$DIR"/hardware/intel.sh
fi

if lspci | grep -E "VGA.*Intel" >/dev/null 2>&1 && lspci | grep -E "3D.*NVIDIA" >/dev/null 2>&1; then
	echo "=============================="
	echo " Configuring NVIDIA Optimus"
	echo "=============================="
	"$DIR"/hardware/nvidia-optimus.sh
fi
