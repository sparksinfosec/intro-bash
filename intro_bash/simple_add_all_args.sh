#!/usr/bin/bash 
totalvar=0
until [ $# -eq 0 ]
do
	addedvar=$1
	totalvar=$(($addedvar + $totalvar))
	shift
done
echo $totalvar
