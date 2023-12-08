#!/usr/bin/bash 
read -p "Enter the first number: " firstnum
read -p "Enter the second number: " secondnum
total=$(($firstnum + $secondnum))
echo "The sum of $firstnum and $secondnum is $total"
