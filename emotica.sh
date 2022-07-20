#! /bin/sh

cat $HOME/txt/emotica | dmenu -nb "#333333" -sb "#444444" -p "Select an emoticon" -i -l 20 | awk '{print $1}' | tr -d "\t" | xclip -selection "clipboard"

notify-send -i /dev/null -u "low" "Successfuly coppied to your clipboard!"
