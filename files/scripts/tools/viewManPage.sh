#!/usr/bin/env bash

# Select a manpage and view on browser

# Search man pages
manPage=$(man -k . | rofi -dmenu | cut -d ' ' -f 1)

if [ "${manPage}" == "" ]; then
   exit 1
fi

# Convert to pdf
man -t ${manPage} | ps2pdf - /tmp/${manPage}.pdf

# Open
${BROWSER} /tmp/${manPage}.pdf

# Delete
rm /tmp/${manPage}.pdf
