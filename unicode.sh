#!/bin/bash

input=$(echo "Exit" | dmenu -nb "#333333" -sb "#444444" -p "Input unicode")
formated=$(echo -e "\u$input")
echo $formated | xclip -selection "clipboard" 
notify-send -i /dev/null -t 5000 -u "low" "Character selected: $formated"
