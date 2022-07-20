#!/bin/bash
# Issue: Not fast enough.

list="$HOME/txt/1k-words"
listlen="$(cat $list | wc -l)"
randlen=`expr $RANDOM % $listlen`
i=0
while IFS= read -r line; do
    #echo $i
    if (( $randlen == $i )); then
        echo $line
        exit
    else
        i=`expr $i + 1`
    fi
done < $list
