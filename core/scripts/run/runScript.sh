#!/usr/bin/env bash

# Run a script in terminal

terminal=urxvt
scriptfile="$1"

# Check if tool is available
if ! [ -x "$(command -v ${terminal})" ]; then
    notify-send -u critical -i "notification-message-IM" "${terminal} is not installed"
    exit 1
fi

# Check if file exists
if [ -z ${scriptfile} ] ; then
    echo "ERROR: Missing script file"
    exit 1
fi


# Run app
${terminal} --hold -e ${scriptfile}
