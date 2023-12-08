#!/usr/bin/bash
echo "Please select one of the following:
add sub mul div exp mod"
read -p "Enter the operator: " operatorvar
read -p "Enter the first number: " firstnum
read -p "Enter the second number: " secondnum 
if [ $operatorvar = "add" ]
then 
	total=$(($firstnum + $secondnum))
elif [ $operatorvar = "sub" ]
then 
	total=$(($firstnum - $secondnum))
elif [ $operatorvar = "mul" ]
then 
	total=$(($firstnum * $secondnum))
elif [ $operatorvar = "div" ]
then 
	total=$(($firstnum / $secondnum))
elif [ $operatorvar = "exp" ]
then 
	total=$(($firstnum ** $secondnum))
elif [ $operatorvar = "mod" ]
then 
	total=$(($firstnum % $secondnum))
else
	echo "Wrong operator given"
fi

echo "The $operatorvar of $firstnum and $secondnum is $total"


