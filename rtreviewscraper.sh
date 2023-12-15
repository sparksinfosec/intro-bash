#!/usr/bin/bash 

read -p "Enter a movie for RT reviews (lowercase, seperated by spaces): " movieinput #get a movie

rturl="https://www.rottentomatoes.com/m" #the rotten tomato format
topcritics="reviews?type=top_critics" #for getting the reviews
rtmovieformat="${movieinput// /_}" #replaces spaces with _ so it can fit in the url formats
wholeurl="$rturl/$rtmovieformat/$topcritics" #this makes it easier for all the curls
filenotfound=$(curl -s "$wholeurl" | grep "<h1>" | cut -d'>' -f 2 | cut -d' ' -f 1) #for 404 pages where the input does not exist
rtpercentage=$(curl -s "$rturl/$rtmovieformat" | grep "tomatometerscore" | cut -d'"' -f 2) #getting the RT score
audiencepercentage=$(curl -s "$rturl/$rtmovieformat" | grep "audiencescore" | cut -d'"' -f 2) #getting the audience score

function TheReviews { #function for getting the review into a file 
	echo "Reviews for the movie $movieinput:" >> $rtmovieformat.txt #first line
	echo "--" >> $rtmovieformat.txt #adding this for the sed to come later (makes sure reviews before each review blurb
	curl -s "$wholeurl" | grep -A 2 "review-quote" | cut -d ">" -f 2 >> $rtmovieformat.txt #gets all the divs that contain the reviews 
        dos2unix -q $rtmovieformat.txt #found this will remove all ^M from the vim/txt file created
        sed -i "/^$/d" $rtmovieformat.txt #removes extra blank lines
        sed -i "s/^[ \t]*//" $rtmovieformat.txt #removes the long spaces at the start of reviews
	sed -i "s/^--/\nReview:/g" $rtmovieformat.txt #replaces all of the -- at the beginning of lines with reviews 
}

function GoodvBadreviews {
        goodreviews=$(curl -s "$wholeurl" | grep "class=\"review_icon icon small fresh\"" | wc -l) #too see how many reviews are on the page with the fresh icon 

        badreviews=$(curl -s "$wholeurl" | grep "class=\"review_icon icon small rotten\"" | wc -l) #how many review with the rotten icon
	totalreviews=$(($goodreviews + $badreviews)) #add them together -- should be 12 until bash can man the dom?
	echo "" >> $rtmovieformat.txt #new line 
	echo "The Rotten Tomatoes Score is $rtpercentage/100" >> $rtmovieformat.txt #print the rt score 
	echo "The audience score is $audiencepercentage/100" >> $rtmovieformat.txt #audience score
	echo "There are $totalreviews reviews" >> $rtmovieformat.txt  # total number of reviews
        echo "There are: $goodreviews positive reviews" >> $rtmovieformat.txt #how many are good
        echo "There are: $badreviews negative reviews" >> $rtmovieformat.txt #how many are bad
}


if [[ $filenotfound = "404" ]] #first check if a 404 comes up with the input text
then 
	echo "Movie title not found please try again"
elif [[ -z $filenotfound ]] # check to see if file not found is blank (better check) there are weird use cases with some movies 
then 
	rm -f $rtmovieformat.txt #essentially check to see if file exist if it does remove it so we are no appending extra stuff over and over again
	TheReviews #call the function to add the reviews
	GoodvBadreviews #func to append the rt score and audience score + total 
	echo "File created with top critic reviews $rtmovieformat.txt" #file should be created if it hits the func
	echo "$movieinput has a $rtpercentage percent from rotten tomatoes and a $audiencepercentage percent from the audience"
	read -p "would you like to read the top 20 reviews y [yes]/ n [no] " yesorno #ask if they want to print the file (way to do it reivew by review and keep asking?
	if [[ $yesorno = "y" ]] #if yes we will cat it 
	then
		cat $rtmovieformat.txt
	else #anything else just tell them they can look later
	       echo "Ok you can view the first 20 top critic reviews at $rtmovieformat.txt"
	fi	       

else
	"Error try again" #shouldn't really run but not sure if there is an inbetween 404 and valid url (I don't think there is)
fi
