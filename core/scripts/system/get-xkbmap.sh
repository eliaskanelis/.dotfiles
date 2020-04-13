#!/usr/bin/env bash
#
# Acquire the current keyboard layout

CURRENT="$(setxkbmap -query | sed '/^l/!d ; s,.*:[\ ]*,,g')"
echo "${CURRENT}"
