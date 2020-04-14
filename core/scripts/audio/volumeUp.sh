#!/usr/bin/env bash

# Raise the volume

# Check if tool is available
if ! [ -x "$(command -v amixer)" ]; then
    notify-send -u critical -i "notification-message-IM" "Volume up failed" "amixer is not installed"
    exit 1
fi

amixer sset Master 0.5dB+
exit 0

# Get volume
volume=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget "Master") | sed 's/%//g')


# Raise 5%
volume=$((volume+5))

# Limit the upper volume to 100%
if [ "${volume}" -gt "100" ]; then
    volume=100
fi

# Set the volume
amixer sset "Master" "${volume}%"
