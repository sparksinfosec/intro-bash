#!/usr/bash/bin
right=0
wrong=0
total=0 #for the percentage and total print out
function RightWrongPercent {  #func that will run the percentages and display the current score
	percentageright=$(( 100 * $1 / $3 )) #percentage right
	percentagewrong=$(( 100 * $2 / $3 )) #percentage wrong
	echo "SCOREBOARD" # print the scoreboard
	echo "You have answered $1 correctly out of $3"
	echo "You have missed $2 out of $3"
	echo "Correct: $percentageright%"
	echo "Incorrect: $percentagewrong%"
	echo ""
}

curl -s  https://www.afi.com/afis-100-years-100-movie-quotes/ | grep -A 2 "<h6 class=" | tail -n 399 | cut -d">" -f 2 | cut -d"<" -f 1 > .moviequotes.txt #getting the file from AFI 100 best quotes
sed -i "s/--//g" .moviequotes.txt #clear the -- 
sed -i "/^$/d" .moviequotes.txt #clear extra blank lines in between
sed -i "s/^[ ]*//" .moviequotes.txt #clear the spaces at the beginning of the line 

while [[ $numberchoice != "q" ]] #run a while loop to go on forever
do
	echo "Movie Quote Game" #start the game 
	echo ""
	read -p "Choose a number between (1-100) or q to quit: " numberchoice #get user input for a number
	if [[ $numberchoice -gt 100 || $numberchoice -eq 0 ]] #check to see if number is 0 or more than 100
	then 
		if [[ $numberchoice == 'q' ]] #then see if they want to quit 
		then 
			echo "Thanks for playing!!" #goodbye and exit
			echo "You tried $total quotes"
			echo "With $right right"
			echo "And $wrong wrong"
			exit
		else
			echo "Please enter a number between 1-100 only" #if not q then they must have entered something outside of 1-100
	         	exit 
		fi
	fi
	moviequote=$(grep -A 2 "^$numberchoice. " .moviequotes.txt | cut -d'"' -f 2 | head -n 1) #after check we get the quote
	movie=$(grep -A 1 "^$numberchoice. " .moviequotes.txt | tail -n 1) #we get the movie name 
	moviecheck=$( echo $movie | tr '[:upper:]' '[:lower:]' ) #format the movie to make sure lowercase
	echo ""
	echo \"$moviequote\" #print the movie quote with quotes
	echo ""
	read -p "What movie is this quote from (include spaces and full name of the movie): " answer #get the answer
	answercheck=$( echo $answer | tr '[:upper:]' '[:lower:]' ) #make sure its lowercase for the check to see if its right
	if [[ $answercheck = $moviecheck ]] #if it matches exactly 
	then 
		echo ""
		echo "Correct! The movie was: $movie"
		right=$(( $right + 1 )) #increament right and total
		total=$(( $total + 1 ))
		echo ""
	else #if it does not match exactly then it is wrong
		echo ""
		echo "Incorrect: The Movie was $movie"
		wrong=$(($wrong + 1)) #increament wrong and total 
		total=$(($total + 1))
		echo ""
	fi
	RightWrongPercent $right $wrong $total #if right or wrong is 0 it won't divide so print after the first, and after each check 
done
