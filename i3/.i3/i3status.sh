#!/bin/bash

# shell scipt to prepend i3status with more stuff

i3status --config ~/.i3/i3status.conf | while :
do
    read line
    #LG="$(setxkbmap -query | grep layout | perl -pe 's/^layout: +([^ ]+)$/$1/')"
    #if [ $LG == "us" ] then
    #    dat="US"
    #else
    #    dat="?"
    #fi
    #echo "${line} | ${LG}" || exit 1
    echo "${line}" || exit 1
done
