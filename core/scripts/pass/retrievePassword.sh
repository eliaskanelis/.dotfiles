#!/usr/bin/env bash
#
# Rofi script to retrieve the password
# from KeepassXC database


keepass_error()
{
    notify-send -u critical -i "notification-message-IM" "KeePassXC error"
    exit 1
}

# The path of the keepassxc database
vault="${HOME}"/passwords.kdbx

# Password
password=$(zenity --password)

# Verify that indeed user typed a password
if [ "${password}" == "" ]; then
    exit 0
fi

# List all database entries
entries_raw=$(echo "${password}" | keepassxc-cli locate "${vault}" / || keepass_error)
entries=$(echo "${entries_raw}" | sed 1d)

# Verify that user made a choice
# or has permission (password was good)
if [ "${entries}" == "" ]; then
    exit 0
fi

# Let user select
user_selection=$(echo "${entries}" | rofi -dmenu -i -theme "system" -p "Which password you want?")

# Verify that user made a choice
if [ "${user_selection}" == "" ]; then
    exit 0
fi

# Copy the password in clipboard
echo "${password}" | keepassxc-cli clip "${vault}" "${user_selection}" 1> /dev/null || keepass_error

# Notify user
notify-send -t 3000 "Password for ${user_selection} copied to clipboard!"
