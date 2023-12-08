#!/usr/bin/bash
read -p "Enter another word: " secretword
while [ $secretword != "Banana" ]
do
	read -p "Enter another word: " secretword
done 
echo "That's the secret word!"
