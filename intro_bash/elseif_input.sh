#!/usr/bin/bash 
exitvar="notset"
while [ $exitvar != "exit" ]
do 
	read -p "Enter: " exitvar
	if [ $exitvar = "technology" ]
	then 
		echo "pizza"
	elif [ $exitvar = "memory" ]
	then 
		echo "cookie" 
	elif [ $exitvar = "error" ]
	then 
		echo "steak"
	elif [ $exitvar = "banana" ]
	then 
		echo "hungry"
	else
		echo "enter in exit to end"
	fi
done
