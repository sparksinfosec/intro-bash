#!/usr/bin/bash 
totalvar=0

if [ $1 = "add" ]
then 
	shift
	until [ $# -eq 0 ]
	do
		addedvar=$1
		totalvar=$(($addedvar + $totalvar))
		shift
	done
elif [ $1 = "sub" ]
then 
	shift 
	until [ $# -eq 0 ]
	do 
		firstvar=$1 #how do we sub if we can not start at 0? 
		shift
		secondvar=$1  
		totalvar=$(($firstvar - $secondvar))
		shift
		for i in $@  #another loop that allows the first to numbers to be subed then loop thru the rest against the total
		do 
			totalvar=$(($totalvar-$1))
			shift
		done
	done
elif [ $1 = "mul" ]
then 
	shift
        until [ $# -eq 0 ]
	do 
		firstvar=$1
		shift
		secondvar=$1
		totalvar=$(($firstvar * $secondvar))
		shift
		for i in $@
		do 
			totalvar=$(($totalvar * $1))
			shift
		done
	done	
elif [ $1 = "div" ]
then 
	shift 
	until [ $# -eq 0 ]
	do 
		firstvar=$1
		shift
		secondvar=$1
		totalvar=$(($firstvar / $secondvar))
		shift 
		for i in $@
		do 
			totalvar=$(($totalvar / $1))
			shift
		done
	done
elif [ $1 = "exp" ]
then 
	shift 
	until [ $# -eq 0 ]
	do
		firstvar=$1
		shift
		secondvar=$1
		totalvar=$(($firstvar ** $secondvar))
		shift 
		for i in $@
		do 
			totalvar=$(($totalvar ** $1)) 
			shift
		done
	done
elif [ $1 = "mod" ]
then 
	shift
	until [ $# -eq 0 ]
	do 
		firstvar=$1
		shift 
		secondvar=$1
		totalvar=$(($firstvar % $secondvar))
		shift 
		for i in $@
		do 
			totalvar=$(($totalvar % $1))
			shift
		done
	done
else
	echo "Please enter in correct operator: add, sub, mul, div, exp, mod"
fi
echo $totalvar
 

