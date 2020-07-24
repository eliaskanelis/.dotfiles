#!/usr/bin/env bash

# Select menu

#BROWSER=xdg-open
#BROWSER=firefox

# Check if tool is available
if ! [ -x "$(command -v ${BROWSER})" ]; then
    notify-send -u critical "Search failed" "Browser is not installed"
    exit 1
fi

if ! [ -x "$(command -v rofi)" ]; then
    notify-send -u critical "Locate failed" "rofi is not installed"
    exit 1
fi

# Run program
engine=$(echo "Google Youtube StackOverflow Github Wikipedia ArchWiki Reddit DockerImage cppreference PyPi" | tr " " "\n" | rofi -dmenu -i -theme "system" -p "Engine: "  )

if [ "${engine}" == "Google" ]; then
    choice=$(rofi -dmenu -theme "system" -p "Google: "  )
    ${BROWSER} http://www.google.com/search?q="${choice}"

elif [ "${engine}" == "Youtube" ]; then
    choice=$(rofi -dmenu -theme "system" -p "Youtube: "  )
    ${BROWSER} https://www.youtube.com/results?search_query="${choice}"

elif [ "${engine}" == "StackOverflow" ]; then
    choice=$(rofi -dmenu -theme "system" -p "StackOverflow: "  )
    ${BROWSER} https://stackoverflow.com/search?q="${choice}"

elif [ "${engine}" == "Wikipedia" ]; then
    choice=$(rofi -dmenu -theme "system" -p "Wikipedia: "  )
    ${BROWSER} https://www.wikipedia.org/wiki/Special:Search?search="${choice}"

elif [ "${engine}" == "Github" ]; then
    choice=$(rofi -dmenu -theme "system" -p "Github: "  )
    ${BROWSER} https://github.com/search?q="${choice}"

elif [ "${engine}" == "ArchWiki" ]; then
    choice=$(rofi -dmenu -theme "system" -p "ArchWiki: "  )
    ${BROWSER} https://wiki.archlinux.org/index.php?search="${choice}"

elif [ "${engine}" == "Reddit" ]; then
    choice=$(rofi -dmenu -theme "system" -p "Reddit: "  )
    ${BROWSER} https://www.reddit.com/search/?q="${choice}"

elif [ "${engine}" == "DockerImage" ]; then
    choice=$(rofi -dmenu -theme "system" -p "Docker Image: "  )
    ${BROWSER} "https://hub.docker.com/search?q=${choice}&type=image"

elif [ "${engine}" == "cppreference" ]; then
    choice=$(rofi -dmenu -theme "system" -p "cppreference: "  )
    ${BROWSER} "https://en.cppreference.com/?&search=${choice}"

elif [ "${engine}" == "PyPi" ]; then
    choice=$(rofi -dmenu -theme "system" -p "PyPi: "  )
    ${BROWSER} "https://pypi.org/search/?q=${choice}"

else
    echo ""
fi;
