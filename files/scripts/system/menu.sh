#!/usr/bin/env bash

# Select menu

# Check if tool is available
if ! [ -x "$(command -v rofi)" ]; then
    notify-send -u critical "Power option failed" "rofi is not installed"
    exit 1
fi

# Run program
rv=$(echo "Shutdown Lock Logout Reboot" | tr " " "\n" | rofi -dmenu -theme arthur -p "Power options"  )

if [ "${rv}" == "Shutdown" ]; then
    bash ~/scripts/system/shutdown.sh

elif [ "${rv}" == "Lock" ]; then
    bash ~/scripts/system/lock.sh

elif [ "${rv}" == "Logout" ]; then
    bash ~/scripts/system/logout.sh

elif [ "${rv}" == "Reboot" ]; then
    bash ~/scripts/system/reboot.sh

else
    echo ""
fi;
