#!/usr/bin/env bash

# Run calculator

# Check if tool is available
if ! [ -x "$(command -v gnome-calculator)" ]; then
    notify-send -u critical -i "notification-message-IM" "Calculator is not installed"
    exit 1
fi

# Run program
gnome-calculator
