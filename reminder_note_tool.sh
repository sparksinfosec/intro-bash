#!/usr/bin/bash

rememberfile="$HOME/.remember"

if [ ! -f $rememberfile ]
then 
	echo "No file yet it has been created, run again tho"
	touch $rememberfile
	echo "This is $USER reminders:" >> $rememberfile
elif [[ $1 == "note" ]] && [[ $# -eq 1 ]]
then
       echo "Enter Notes, end with ^D: "       
       cat >> $rememberfile
elif [[ $1 == "note" ]] && [[ $# > 1 ]]
then 
	shift 
	echo "$@" >> $rememberfile 
elif [[ $1 == "remindme" ]] && [[ $# -eq 1 ]]
then 
	more $rememberfile 
elif [[ $1 == "remindme" ]] && [[ $2 == "search" ]]
then 
	read -p "Grep me bro: " greppass
	grep -i -- "$greppass" $rememberfile | ${PAGER:-more}
else 
	echo "Something went wrong checkout the read me" 
fi
