#!/usr/bin/env bash

# Lock the session

# Check if tool is available
if ! [ -x "$(command -v i3lock)" ]; then
    notify-send -u critical -i "notification-message-IM" "Locking session failed" "i3lock is not installed"
    exit 1
fi

i3lock -e -t -i ~/.wallpaper.png
