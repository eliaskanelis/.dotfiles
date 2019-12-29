#!/usr/bin/env bash

# Synchonizes the source file or directory (only update the destination )
# with a remote cloud destination (dropbox)
#
# Usage: sentToDropbox source remote:destination
#

SOURCE="$1"
DESTINATION=dropbox:shared

CONFIGFILE=${HOME}/.rclone.conf

# Check for config file
if [ ! -f ${CONFIGFILE} ]; then
    notify-send -u critical -i "notification-message-IM" "Config file for rclone is missing!"
    exit 1
fi

# Check for source file
if [ ! -e "${SOURCE}" ]; then
    notify-send -u critical -i "notification-message-IM" "Please provide a valid source file or dir!"
    exit 1
fi

# Check for destination file
if [ ! "${DESTINATION}" != "" ]; then
    notify-send "Please provide a destination!"
    exit 1
# Check for the existance of : character
elif [[ "${DESTINATION}" != *":"* ]]; then
    notify-send -u critical -i "notification-message-IM" "Destination is not valid!"
    exit 1
fi

# Directories should be copied to a dir with the same name
if [ ! -f "${SOURCE}" ]; then
    DESTINATION="${DESTINATION}"/"$(basename "${SOURCE}")"
fi

# Sync( change only destination ) excluding the hidden files and folders
notify-send "Will sent '${SOURCE}' to '${DESTINATION}'!"
/usr/bin/rclone --config ${CONFIGFILE} copy "${SOURCE}" "${DESTINATION}"
notify-send "'${SOURCE}' was sent succesfully to '${DESTINATION}'!"
