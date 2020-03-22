#!/usr/bin/env bash

# Locate any file or directory and open it with default program

# Check if tool is available
if ! [ -x "$(command -v rofi)" ]; then
    notify-send -u critical "Locate failed" "rofi is not installed"
    exit 1
fi

# Run program
#locate home media | rofi -threads 0 -width 100 -dmenu -i -p "locate" -theme "system" | xargs -r -0 xdg-open

#mylocate home media | rofi -threads 0 -width 100 -dmenu -i -p "locate" -theme "system" | xargs -r -0 xdg-open

locate --database="${HOME}/.mlocate.db" home media | rofi -threads 0 -width 100 -dmenu -i -p "locate" -theme "system" | xargs -r -0 xdg-open
