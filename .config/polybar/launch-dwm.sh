#!/bin/bash

# TODO: This could be ignored and we could just use polybar restart

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar achdwm &

echo "Polybar launched..."
