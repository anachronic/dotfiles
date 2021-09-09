#!/bin/bash

ACTIVE_WINDOW=$(xdotool getactivewindow)
CHROMIUM_WINDOWS=$(xdotool search --class chromium)

if [ -n "${ACTIVE_WINDOW}" ]; then
  if [[ "${CHROMIUM_WINDOWS[@]}" =~ "${ACTIVE_WINDOW}" ]]; then
    xdotool key --delay 0 --clearmodifiers ctrl+l
  else
    xdotool key --delay 0 --clearmodifiers super+l
  fi
fi
