#!/bin/bash

ACTIVE_WINDOW=$(xdotool getactivewindow)
KITTY_WINDOWS=$(xdotool search --class kitty)

if [ -n "${ACTIVE_WINDOW}" ]; then
  if [[ "${KITTY_WINDOWS[@]}" =~ "${ACTIVE_WINDOW}" ]]; then
    xdotool key --delay 0 --clearmodifiers ctrl+shift+c
  else
    xdotool key --delay 0 --clearmodifiers ctrl+c
  fi
fi
