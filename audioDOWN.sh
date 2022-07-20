#!/bin/sh

pulsemixer --change-volume -10
notify-send -u "low" "Volume: $(pulsemixer --get-volume)"
