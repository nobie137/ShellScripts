#!/bin/sh
# Thanks you Luke Smith.

# The famous "get a menu of emojis to copy" script.

# Get user selection via dmenu from emoji file.
chosen=$(cut -d ';' -f1 ~/txt/emoji | dmenu -nb "#333333" -sb "#444444" -p "Select an emoji" -i -l 30 | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
    xdotol type "$chosen"
else
    printf "$chosen" | xclip -selection clipboard
    notify-send "'$chosen' copied to clipboard."
fi
#! /bin/sh

cat /home/nobie/txt/emotica | dmenu  -i -l 20 | awk '{print $1}' | tr -d "\t" | xclip -selection "clipboard"

notify-send -i /dev/null -u "low" "Successfuly coppied to your clipboard!"
