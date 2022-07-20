#!/bin/bash
# Title: rbxdump
# Description: Simple tool to dump contents of a rbxl file or an asset.
# Author: Nobie
# Website: https://boggers.neocities.org/

#TODO:
#   [ ] Get assetIDs that don't have a prefix(:// or id=).

VERSION="3.1"
scan(){
[[ "$(strings /tmp/rbxdump0 | head -n 1 | cut -c 1-13)" == "<roblox xmlns" ]] && {
    curl -Ls "https://assetdelivery.roblox.com/v1/asset?id=$1" > /tmp/rbxdump0
    echo -e "Filetype: clean/xml\n"
    x=$(grep -o -E id=[0-9]+ /tmp/rbxdump0 | cut -c 4-) 
    z=$(echo -e $x | wc -w) 
    for i in `seq 1 $z`
    do
        y=$(echo $x | awk '{print $"'$i'"}')
        echo -E "https://www.roblox.com/library/$y"
    done
}||{
    echo -e "Filetype: bin/xml\n"
    strings $1 | grep -o -E id=[0-9]+ | cut -c 4- > /tmp/rbxdump0
    x=$(grep -oaE id[:-=][0-9]+ $1 | cut -c 4-) 
    strings $1 | grep -o -E id:\/\/[0-9]+ | cut -c 6- >> /tmp/rbxdump0
    xx=$(grep -oaE id:\/\/[0-9]+ $1 | cut -c 6-) 
    z=$(cat /tmp/rbxdump0 | wc -w) 
    for i in `seq 1 $z`
    do
        y=$(cat /tmp/rbxdump0 | awk 'NR=="'$i'"')
        echo -E "https://www.roblox.com/library/$y"
    done
    echo "Dumped: $z"
}
}
helpPage(){
    echo -e "rbxdump help page:\n\t-h [Print help page]\n\t-x [Download and print original XML data]\n\t-d [Dump a assetID/Placefile]\n\t-v [Print version]"
}
downloadXML(){
    curl -Ls "https://assetdelivery.roblox.com/v1/asset?id=$1" > /tmp/rbxdump0
    cat /tmp/rbxdump0
}
if [[ $1 == "-h" ]] 
    then helpPage
elif [[ $1 == "-x" ]]
    then downloadXML $2
elif [[ $1 == "-d" ]]
    then scan $2
elif [[ $1 == "-m" ]]
    then scanModel $2
elif [[ $1 == "-v" ]]
    then echo $VERSION
else helpPage
fi
