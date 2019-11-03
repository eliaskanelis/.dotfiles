#!/usr/bin/env bash

# Use both screens

# Check if tool is available
if ! [ -x "$(command -v xrandr)" ]; then
    notify-send -u critical -i "notification-message-IM" "Setting display failed" "xrandr is not installed"
    exit 1
fi

# Set both displays
xrandr --auto --output VGA1 --primary --mode 1920x1080 --left-of LVDS1
