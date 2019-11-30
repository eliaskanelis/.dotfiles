#!/usr/bin/env bash

# Run file manager

#fileManager=ranger
fileManager=nemo

# Check if tool is available
if ! [ -x "$(command -v i3-sensible-terminal)" ]; then
    notify-send -u critical -i "notification-message-IM" "i3-sensible-terminal is not installed"
    exit 1
fi

if ! [ -x "$(command -v ${fileManager})" ]; then
    notify-send -u critical -i "notification-message-IM" "${fileManager} is not installed"
    exit 1
fi

# Run app
#i3-sensible-terminal -e ${fileManager}
${fileManager} ${HOME}/Desktop/
