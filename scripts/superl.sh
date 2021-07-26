#!/bin/bash

ACTIVE_WINDOW=$(xdotool getactivewindow)
FIREFOX_WINDOWS=$(xdotool search --class firefox)

if [ -n "${ACTIVE_WINDOW}" ]; then
  if [[ "${FIREFOX_WINDOWS[@]}" =~ "${ACTIVE_WINDOW}" ]]; then
    xdotool key --delay 0 --clearmodifiers ctrl+l
  else
    xdotool key --delay 0 --clearmodifiers super+l
  fi
fi
