#!/usr/bin/env bash

# Run tmux

# Check if tool is available
if ! [ -x "$(command -v i3-sensible-terminal)" ]; then
    notify-send -u critical -i "notification-message-IM" "i3-sensible-terminal is not installed"
    exit 1
fi

if ! [ -x "$(command -v tmux)" ]; then
    notify-send -u critical -i "notification-message-IM" "tmux is not installed"
    exit 1
fi

# Run app
i3-sensible-terminal -e tmux
