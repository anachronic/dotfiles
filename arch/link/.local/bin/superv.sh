#!/bin/bash

ACTIVE_WINDOW=$(xdotool getactivewindow)
TERM_WINDOWS=$(xdotool search --class "(kitty|alacritty|st)")

if [ -n "${ACTIVE_WINDOW}" ]; then
    if [[ "${TERM_WINDOWS[@]}" =~ "${ACTIVE_WINDOW}" ]]; then
        xdotool key --delay 0 --clearmodifiers ctrl+shift+v
    else
        xdotool key --delay 0 --clearmodifiers ctrl+v
    fi
fi
