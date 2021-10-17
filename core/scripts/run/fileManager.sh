#!/usr/bin/env bash

# Run file manager

#fileManager=ranger
#fileManager=nemo
fileManager=thunar

# Optional arguments
input_path="$1"

# Check if tool is available
if ! [ -x "$(command -v i3-sensible-terminal)" ]; then
    notify-send -u critical -i "notification-message-IM" "i3-sensible-terminal is not installed"
    exit 1
fi

if ! [ -x "$(command -v ${fileManager})" ]; then
    notify-send -u critical -i "notification-message-IM" "${fileManager} is not installed"
    exit 1
fi

path="${HOME}"/Desktop/
if [[ "${input_path}" != "" ]]
then
    # Relative to absolute
    path="$(cd "$(dirname "${input_path}")"; pwd)/$(basename "${input_path}")"
fi

# Run app
${fileManager} "${path}"
