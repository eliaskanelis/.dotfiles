#!/bin/bash

# Locate any file or directory and open it with default program

locate home media | rofi -threads 0 -width 100 -dmenu -i -p "locate" -theme arthur | xargs -r -0 xdg-open
