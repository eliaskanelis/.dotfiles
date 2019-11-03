#!/usr/bin/env bash

# Mute the volume

# Check if tool is available
if ! [ -x "$(command -v pactl)" ]; then
    notify-send -u critical -i "notification-message-IM" "Mute volume failed" "Pactl is not installed"
    exit 1
fi

# Mute
pactl set-sink-mute 0 toggle
