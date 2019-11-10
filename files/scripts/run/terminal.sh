#!/usr/bin/env bash

# Run terminal

#terminal=gnome-terminal
terminal=urxvt

# Check if tool is available
if ! [ -x "$(command -v ${terminal})" ]; then
    notify-send -u critical -i "notification-message-IM" "${terminal} is not installed"
    exit 1
fi

# Run app
${terminal}
