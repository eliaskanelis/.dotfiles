#!/usr/bin/env bash

# Raise the volume

# Check if tool is available
if ! [ -x "$(command -v pactl)" ]; then
    notify-send -u critical -i "notification-message-IM" "Volume up failed" "Pactl is not installed"
    exit 1
fi

# Get volume
volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

# Raise 5%
volume=$((volume+5))

# Limit the upper volume to 100%
if [ "${volume}" -gt "100" ]; then
    volume=100
fi

# Set the volume
pactl set-sink-volume 0 "${volume}%"
