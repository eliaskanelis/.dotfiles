#!/usr/bin/env bash

# Run tmux

TERMINAL=/usr/bin/urxvt

# Check if tool is available
if ! [ -x "$(command -v ${TERMINAL})" ]; then
    notify-send -u critical -i "notification-message-IM" "${TERMINAL} is not installed"
    exit 1
fi

if ! [ -x "$(command -v tmux)" ]; then
    notify-send -u critical -i "notification-message-IM" "tmux is not installed"
    exit 1
fi

# Run app
${TERMINAL} -e tmux
