#!/bin/bash

dir="$HOME/.trash"
[[ ! $1 ]] && echo "trash command for trashing files." ||{
    [[ ! -d $dir ]] && mkdir $dir
    [[ $1 == "clean" ]] && rm -rf $dir/* || mv $1 $dir
}
