#!/usr/bin/bash 

baseurl="https://www.city-data.com/zips"

read -p "Enter in a zip (US only 5 digits): " zipinput

zipcode=$(curl -s "$baseurl/$zipinput.html" |  grep -i '<title>' | cut -d"(" -f 2 | cut -d")" -f 1 )
filenotfound=$(curl -s "$baseurl/$zipinput.html" | grep -i '<h2>' | cut -d">" -f 2 | cut -d"<" -f 1 ) 

if [[ $filenotfound = "Error 404" ]]
then
       echo "$zipinput not found: $filenotfound"
elif [[ -z $filenotfound ]]
then 
       echo "$zipinput is in $zipcode"
else
       echo "can not compute"
fi




