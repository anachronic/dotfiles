#!/bin/bash

choices="standalone\nDPright\nDPmirror\nDPonly\nHDMIright\nHDMImirror\nHDMIonly\nManual selection"

chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in
	DPright) dpright.sh ;;
	DPmirror) dpmirrored.sh ;;
	DPonly) dponly.sh ;;
	HDMIright) hdmi2right.sh ;;
	HDMImirror) hdmi2mirrored.sh ;;
	HDMIonly) hdmi2only.sh ;;
	standalone) standalone-laptop.sh ;;
	"Manual selection") arandr ;;
esac

# Relaunch polybar if there was a selection.
[ "$chosen" == "" ] || polybarlaunch.sh
