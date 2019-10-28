#!/bin/bash

# Select menu

rv=$(echo "Shutdown Lock Logout " | tr " " "\n" | rofi -dmenu -theme arthur -p "Power options"  )

if [ "${rv}" == "Shutdown" ]; then
    bash ~/scripts/system/shutdown.sh

elif [ "${rv}" == "Lock" ]; then
    bash ~/scripts/system/lock.sh

elif [ "${rv}" == "Logout" ]; then
    bash ~/scripts/system/logout.sh

else
    echo ""
fi;
