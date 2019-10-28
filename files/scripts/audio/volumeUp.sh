#!/bin/bash

# Raise the volume

# Raise 5%
pactl set-sink-volume 0 +5%

rv=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

# Limit the upper volume to 100%
if [ "${rv}" -gt "100" ]; then
    pactl set-sink-volume 0 100%
fi;
