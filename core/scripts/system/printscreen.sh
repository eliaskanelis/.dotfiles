#!/usr/bin/env bash

# Print the screen

# Check if tool is available
if ! [ -x "$(command -v scrot)" ]; then
    notify-send -u critical "Printscreen failed" "scrot is not installed"
    exit 1
fi

if ! [ -x "$(command -v gimp)" ]; then
    notify-send -u critical "Printscreen failed" "gimp is not installed"
    exit 1
fi

# Run app
scrot -e 'mv $f /tmp/ && gimp /tmp/$f' --quality 100
