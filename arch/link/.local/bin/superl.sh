#!/bin/bash

ACTIVE_WINDOW=$(xdotool getactivewindow)
BROWSER_WINDOWS=$(xdotool search --class "(chromium|firefox)")

if [ -n "${ACTIVE_WINDOW}" ]; then
  if [[ "${BROWSER_WINDOWS[@]}" =~ "${ACTIVE_WINDOW}" ]]; then
    xdotool key --delay 0 --clearmodifiers ctrl+l
  else
    xdotool key --delay 0 --clearmodifiers super+l
  fi
fi
