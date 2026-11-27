#!/bin/bash
# Author Mason Nunez, 2026, licensed under the GPL V3 license.
set -e

[ "$EUID" -eq 0 ] || exec sudo bash "$0" "$@"

sudo apt update && sudo apt install kde-standard  # can be kde-plasma-desktop only for lighter feel
sudo apt-mark manual system76-power system76-driver system76-acpi firmware-manager cosmic-greeter
echo "System will reboot now, after this reboot please run kde2.sh, and log into Plasma via the gear icon in SDDM/Cosmic's greeter!"
sleep 5
sudo reboot
