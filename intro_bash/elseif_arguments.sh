#!/usr/bin/bash
if [ $1 = 'data' ]
then 
	echo "omelette"
elif [ $1 = "processor" ]
then 
	echo "stir fry"
elif [ $1 = "install" ]
then 
	echo "baked potato"
elif [ $1 = "banana" ]
then 
	echo "burrito"
else
	echo "wrong argument entered"
fi


