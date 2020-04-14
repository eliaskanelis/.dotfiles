#!/usr/bin/env bash

# Mute the volume

# Check if tool is available
if ! [ -x "$(command -v amixer)" ]; then
    notify-send -u critical -i "notification-message-IM" "Mute volume failed" "amixer is not installed"
    exit 1
fi

# Mute
#pactl set-sink-mute 0 toggle
amixer -D pulse set "Master" toggle
