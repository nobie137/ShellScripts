#!/bin/sh

pulsemixer --change-volume +10
notify-send "Volume: $(pulsemixer --get-volume)"
