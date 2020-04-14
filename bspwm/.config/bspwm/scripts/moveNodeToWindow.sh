#!/usr/bin/env bash

# Move current node to a window and follow it

if ! [ -x "$(command -v rofi)" ]; then
    notify-send -u critical "Locate failed" "rofi is not installed"
    exit 1
fi

choice=$(bspc query -D --names | tr " " "\n" | rofi -dmenu -i -theme "system" -p "Move to window: " )
id=$(bspc query --nodes --node)
bspc node --to-desktop "${choice}"
bspc desktop --focus "${choice}"
bspc node --focus "${id}"
