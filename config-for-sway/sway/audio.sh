#!/bin/bash

# current_volume=$(/usr/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@)
current_volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

volume="$(echo $current_volume | cut -f 2 -d " " | sed 's/\.//g')"

if [[ $current_volume == *"MUTED"* ]]; then
    echo "  ---"
fi

if [ $current_volume -lt 100 ]; then
    volume="${volume:1}"
fi

if [ $current_volume -lt 10 ]; then
     volume="${volume:1}"
fi


if [ "$volume" -gt "99" ]; then
    echo "  $volume%"
elif [ "$volume" -gt "65" ]; then
    echo "  $volume%"
elif [ "$volume" -gt "30" ]; then
    echo "  $volume%"
elif [ "$volume" -gt "10" ]; then
    echo "  $volume%"
elif [ "$volume" -gt "0" ]; then
    echo "  $volume%"
elif [ "$volume" -lt "1" ]; then
    echo "  ---"
fi
