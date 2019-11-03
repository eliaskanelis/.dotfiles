#!/usr/bin/env bash

# Run terminal

# Check if tool is available
if ! [ -x "$(command -v i3-sensible-terminal)" ]; then
    notify-send -u critical -i "notification-message-IM" "i3-sensible-terminal is not installed"
    exit 1
fi

# Run app
i3-sensible-terminal
