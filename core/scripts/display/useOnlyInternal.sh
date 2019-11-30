#!/usr/bin/env bash

# Use internal


# Check if tool is available
if ! [ -x "$(command -v xrandr)" ]; then
    notify-send -u critical -i "notification-message-IM" "Setting display failed" "xrandr is not installed"
    exit 1
fi

# Set internal display
xrandr --output LVDS1 --primary --mode 1366x768 --output VGA1 --off
