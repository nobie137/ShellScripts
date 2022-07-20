#! /bin/bash

fileAmmount=$(ls | tr -d "\t" | wc -l)
index=1

while [ index != fileAmmount ]; do
  echo "Current image index: $index" $(ls | awk "NR==$index")
  fileName=$(ls | awk "NR==$index")
  nitrogen --set-zoom-fill $fileName
  index=`expr $index + 1`
  sleep 1;
done
