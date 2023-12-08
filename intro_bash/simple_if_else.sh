#!/usr/bin/bash 
read -p "Is it October?: " monthvar
if [ $monthvar = "NO" ]||[ $monthvar = "No" ]||[ $monthvar = "no" ]
then 
	echo "Okay"
elif [ $monthvar = "YES" ]||[ $monthvar = "yes" ]||[ $monthvar = "Yes" ]
then 
	echo "Then it is time to get snoopy!"
else
	echo "input not recognized it's a yes or no"
fi

