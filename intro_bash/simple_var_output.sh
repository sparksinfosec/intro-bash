#!/usr/bin/bash 
read -p "Enter your name: " namevar
read -p "Enter the date: " datevar #have to get the date and then cut it? write if statement for month?
read -p "Enter your city: " cityvar
read -p "Enter the current temperature: " tempvar
read -p "Enter today's birthday: " birthdayvar
read -p "Enter your payable bills: " payablevar
echo "Good day, $namevar. Today is $datevar in the city of $cityvar. 
It is a beautiful $(date | cut -f1 -d' '), the temperature is $tempvar 
degrees. Today is $birthdayvar's birthday. Insurance is payable, 
as are the water, gas, and light bills for a total of \$$payablevar."
