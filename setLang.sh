#! /bin/sh

lang=$(cat /home/$USER/txt/keybaordLangs | dmenu -nb "#333333" -sb "#444444" -p "Choose a language: " | awk '{print $1}')
setxkbmap -layout $lang
