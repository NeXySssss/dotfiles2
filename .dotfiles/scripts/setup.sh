#!/usr/bin/env sh
DIR=$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

. /etc/os-release

echo "######################"
echo " Installing packages"
echo "######################"
$DIR/$ID/packages.sh
echo "######################"
echo " Installing fonts"
echo "######################"
$DIR/$ID/fonts.sh
echo "######################"
echo " Installing themes"
echo "######################"
$DIR/$ID/themes.sh
echo "######################"
echo " Configuring hardware"
echo "######################"
$DIR/$ID/hardware.sh
echo "######################"
echo " Configuring system"
echo "######################"
$DIR/$ID/system.sh
