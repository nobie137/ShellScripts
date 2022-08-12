#! /bin/bash

choice=$(echo -e "[Logout]\n[Shutdown]\n[Reboot]" | dmenu -nb "#333333" -sb "#ff0000" -i -p  "Choose an option")
#echo $choice
if [ $choice == "[Reboot]" ]; then
  reboot
elif [ $choice == "[Logout]" ]; then
  #pkill -KILL -u $USER
  pkill dwm
elif [ $choice == "[Shutdown]" ]; then
  sudo poweroff
else
  echo "Process exited."
fi
