#!/usr/bin/env bash

# Select menu

rv=$(echo "Internal External Both" | tr " " "\n" | rofi -dmenu -theme arthur -p "Screen"  )

if [ "${rv}" == "Internal" ]; then
    bash ~/scripts/display/useOnlyInternal.sh

elif [ "${rv}" == "External" ]; then
    bash ~/scripts/display/useOnlyExternal.sh

elif [ "${rv}" == "Both" ]; then
    bash ~/scripts/display/useBoth.sh

else
    echo ""
fi;
