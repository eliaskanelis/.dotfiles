#!/usr/bin/env bash

# System launcher

# Check if tool is available
if ! [ -x "$(command -v rofi)" ]; then
    notify-send -u critical "Locate failed" "rofi is not installed"
    exit 1
fi

# Run program
rofi -combi-modi window,drun,ssh -theme arthur -show combi
