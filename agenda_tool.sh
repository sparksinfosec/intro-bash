#!/usr/bin/bash 

agendafile="$HOME/.agenda"
eval $(date "+todayweekday=\"%a\" todaymonth=\"%b\" todaynumday=\"%e\" year=\"%G\"") #get everything from todays date
todaydatetotal=$todaymonth$todaynumday$year #format for func 1 
todaydatenoyear=$todaymonth$todaynumday #format for func 2

CheckDate()
{
        testdate1=$1
        testdate2=$2
        testdate3=$3
        IFS="|"
        echo "Your agenda for today:"
        while read date description;
        do
                if [[ "$date" == $testdate1 ]] || [[ "$date" == $testdate2 ]] || [[ "$date" == $testdate3 ]]
                then
                        echo "$description"
                fi
        done < $agendafile
}

if [[ ! -f $agendafile ]] #add file if none exist
then 
	echo "No File for agenda exist, creating..."
	touch $agendafile
	echo "File created please try again"
elif [[ $1 == "add" ]] #if we are passing add then we need to ask for the date or day of the week?
then 
	read -p "Enter in month or day of add [Oct, May, Jul] or [Mon, Wed, Sat]: " dayormonth
	if [ $dayormonth == "Mon" ] || [ $dayormonth == "Tue" ] || [ $dayormonth == "Wed" ] || [ $dayormonth == "Thu" ] || [ $dayormonth == "Fri" ] || [ $dayormonth == "Sat" ] || [ $dayormonth == "Sun" ]
	then                                                                      #check to see if its a day of the week
		dayoftheweek=$dayormonth
		read -p "Add a description for the event or day: " description
	else #else assume its a month 
		read -p "What is the day number: " daynum
		read -p "Four digit year [if curren year use 0] " year
		month=$dayormonth
		read -p "Add a description for the event or day: " description
		if [[ $year == 0 ]]
		then #we need to put the full date together 
			fulldate="$month$daynum" #combining all to make a date to echo in 
		else
			fulldate="$month$daynum$year" #maybe a better check to see valid year entered
		fi
	fi
elif [[ $1 == "read" ]] #added for the checkdate function + to see if read is passed
then 
	CheckDate $todaydatetotal $todaydatenoyear $todayweekday
else #test for checking and running code 
	echo "Unable to compute"
fi

if [[ $dayoftheweek == $dayormonth ]] && [[ $1 == "add" ]] #check to see which one was enter month + day + year
then 
	echo "$dayoftheweek|$description" >> $agendafile #write to the file if is a add + day of the week passed in first read
elif [[ $month == $dayormonth ]] && [[ $1 == "add" ]] #write to file if month/full date is passed and add
then 
	echo "$fulldate|$description" >> $agendafile
else
	exit 0
fi
