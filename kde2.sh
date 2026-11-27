#!/bin/bash
# Author Mason Nunez, 2026, Licensed under the GPL V3 license.
set -e

if [ "$EUID" -ne 0 ]; then
    [[ "$XDG_CURRENT_DESKTOP" == *KDE* ]] || { echo "Not in KDE, exiting."; exit 1; }
    exec sudo bash "$0" "$@"
fi

echo "This WILL nuke Cosmic as a whole. Continue with caution, or the desktops fate shall be decided..."
sleep 10

echo "If you see anything that isn't cosmic-*, ABORT immediently."
sleep 3

sudo apt remove cosmic-desktop cosmic-session cosmic-panel cosmic-dock cosmic-workspaces # Nukes Cosmic as said above
sudo apt autoremove

echo "Done! Enjoy KDE Plasma! (:"
