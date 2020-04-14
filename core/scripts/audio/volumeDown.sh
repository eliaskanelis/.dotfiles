#!/usr/bin/env bash

# Lower the volume

# Check if tool is available
if ! [ -x "$(command -v amixer)" ]; then
    notify-send -u critical -i "notification-message-IM" "Volume down failed" "amixer is not installed"
    exit 1
fi

amixer sset Master 0.5dB-
exit 0

# Get volume
volume=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget "Master") | sed 's/%//g')


# Lower 5%
volume=$((volume-5))

# Limit the lower volume to 0%
if [ "${volume}" -lt "0" ]; then
    volume=0
fi

# Set the volume
amixer sset "Master" "${volume}%"
