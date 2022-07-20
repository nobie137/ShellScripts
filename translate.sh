#!/bin/bash
lang=$(echo "Exit" | dmenu -p "Chose language")
input=$(echo "Exit" | dmenu -p "Input text")
trans :$lang -brief "$input" | xclip -selection "clipboard"
