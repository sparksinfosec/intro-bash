#!/usr/bin/bash  

function PrintBoard { #function that takes in a number and prints the board
	if [[ $1 = 0 ]]
	then 
        clear
		echo " "
		echo " ----------| "
		echo ""
		echo ""
		echo "You have 5 Chances" 
		echo ""
	elif [[ $1 = 1 ]]
	then 
        clear
		echo " " 
		echo " ----------| "
		echo "           O "
		echo ""
	        echo "You have 4 Chances" 
		echo ""
	elif [[ $1 = 2 ]]
	then 
        clear
	        echo " "
                echo " ----------| "
                echo "           O "
		echo "           | "
		echo ""
                echo "You have 3 Chances"
	       echo ""	
        elif [[ $1 = 3 ]]
        then
            clear
                echo " "
                echo " ----------| "
                echo "           O "
		echo "          -|-"
		echo ""
		echo "You have 2 more chances"
		echo ""
       	elif [[ $1 = 4 ]]
        then
                clear
                echo " "
                echo " ----------| "
                echo "           O "
                echo "          -|-"
		echo "           - "
		echo ""
		echo "You have 1 more wrong guess Be Careful"
		echo ""
	elif [[ $1 = 5 ]]
        then
                clear
                echo " "
                echo " ----------| "
                echo "           O "
                echo "          -|-"
                echo "           - "
                echo "          | |"
		echo "  Game Over  "

	else 
	        echo "The end"
	fi
}

read -p "Player 1 enter in a word (10 Letter max): " gameword #read in the game word since hang man is a two player game (usually)
gamewordlength=${#gameword} #get the length for if statment to check if more than 10 letters
guesscount=0 #increase to display board and hit lose condition
guesses="" #no guesses yet
empty="\." #need this for answer to word 
answer="$(echo $gameword | sed "s/[^$empty${guesses}]/-/g")" #changing the word to * for game board
gameword=$( echo $gameword | tr '[:upper:]' '[:lower:]' ) #make sure no cap letters for ease of play


if [ $gamewordlength -gt 10 ] #just need to check that user entered in word below 10 letter
then 
	echo "The word is longer than 10 letters please restart"
	exit
else
	echo "Player 2 get ready to guess"
fi
clear #clear so player two can not cheat 

echo "Welcome to Hangman" #start the game if that passes
echo "Player 2 the word has $gamewordlength letters: $answer" #show how many letters
PrintBoard 0 #print the gallows with nothing on it



until [ $guesscount -eq 5 ] #until statment ? can we break in bash if win is met before 5?
do 
	echo "Previous guesses = $guesses" #print the previous guesses each turn
	read -p "Player 2 guess a letter: " guess #take in a letter 
	guesses="$guesses$guess" #add the guess to the other guesses
	answer="$(echo $gameword | sed "s/[^$empty${guesses}]/-/g")" #add the guess to the encrypted word 
	if [ $answer = $gameword ] #check to see if we won first if the guess is the last chance + one letter away want the win to close first
	then 
		echo "Congrats you guessed the word: $gameword"
		echo "Player 2 Wins"
		break #show break the loop and end the script no matter what part of the loop?
	elif [ $guess = "quit" ] #secret quit if they want to get out 
	then
		echo "You have quit"
		exit 
	elif [ "$(echo $gameword | sed "s/$guess/-/g")" != "$gameword" ]  #check to see if letter was in the word  
	then 
		echo ""
		echo "Correct!"
		echo "$guess is in the word"
        sleep 1.5
		PrintBoard $guesscount
		echo "Guess the Word: $answer" #we should print the answer here so next loop will set the rest of the board
	else 
		echo ""
		echo "Wrong!"
		echo "$guess is not in the word"
        sleep 1.5
                guesscount=$(($guesscount + 1)) #increase the guess count only on incorrect guesses 
	        PrintBoard $guesscount #then print the current state of the board 
	        if [[ $guesscount -eq 5 ]] #within the incorrect option should check to see if guess count hits 5
		then 	
		      echo ""
	              echo "Player 2 could not get the word in time"	      
		      echo "Player 1 Wins"
		      echo "The Word was: $gameword"
	              break #do I need this If this runs the until loop should stop too?
	        fi 	      
		echo "Guess the Word: $answer" #think it should go here so it does not print on the last chance?
		
	fi
	echo "" #spacing for the board 
done 
