#!/usr/bin/env bash

# Select a manpage and view on browser

# Search man pages
manPage=$(man -k . | rofi -dmenu -i -theme "system" | cut -d ' ' -f 1)

if [ "${manPage}" == "" ]; then
   exit 1
fi

# Show in BROWSER
#man -t ${manPage} | ps2pdf - /tmp/${manPage}.pdf
#${BROWSER} /tmp/${manPage}.pdf
#rm /tmp/${manPage}.pdf

# Show in zathura
man -t ${manPage} | ps2pdf - - | zathura -
