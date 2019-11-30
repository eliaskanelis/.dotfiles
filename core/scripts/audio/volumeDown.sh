#!/usr/bin/env bash

# Lower the volume

# Check if tool is available
if ! [ -x "$(command -v pactl)" ]; then
    notify-send -u critical -i "notification-message-IM" "Volume down failed" "Pactl is not installed"
    exit 1
fi

# Lower 5%
pactl set-sink-volume 0 -5%
