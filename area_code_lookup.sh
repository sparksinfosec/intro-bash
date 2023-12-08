#!/usr/bin/bash

sourceurl="https://www.bennetyee.org/ucsd-pages/area.html"


read -p "Enter in a Area Code (US 3 digits only): " codeinput 
numcount=${#codeinput}

if [[ $numcount < 3 ]]
then 
	echo "Too small need 3 digits"
elif [[ $numcount > 3 ]]
then 
        echo "Input is more than 3 digits, come on!"
else 
	areacoderesult=$(curl -s $sourceurl | grep "name=\"$codeinput\"" | cut -d">" -f 11 | cut -d"(" -f 1)
	if [[ -z $areacoderesult ]]
	then 
		echo "It looks like $codeinput is not a valid area code"
	else
		echo "$codeinput area code = $areacoderesult" | xargs
	fi	
fi

