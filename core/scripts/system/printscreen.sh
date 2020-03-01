#!/usr/bin/env bash

# Print the screen

PRINTSCEEN=flameshot

# Check if tool is available
if ! [ -x "$(command -v ${PRINTSCEEN})" ]; then
    notify-send -u critical "Printscreen failed" "${PRINTSCEEN} is not installed"
    exit 1
fi

# Run app
${PRINTSCEEN} gui
