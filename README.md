# bash
Bash scripts and homework assignments 
## Bash Course IFT 383
One of my first major introductions to Bash was in the ASU course IFT 383. In this course we used Bash to solve some smaller problems and tasks, as well as create a few games. I almost immediately fell in love with Bash as it mixes my love for the Linux command line with scripting/programming logic concepts. 
### Layout 
This repo is broken down into different sections. I will include the larger assignments like the hangman game and the nginx log script as well as a few folders that include more simplistic scripts that were assigned during the Shell Scripting course. Most of these include basic introuctions of core concepts and I have tried to include notes in the script, or name them adaptly in order to demonstrate what they do.
* Hangman Game
    * Simple game of hangman two player, input a word, guess the word letter by letter.
    * One of the first shell scripts to really show me the power that bash has. 
* Movie Quote Quiz 
    * Simple movie quote game. Pick a number between 1 and 100 and a quote will print to the screen. Input the answer and it keeps score. 
    * Need to add more checks on the answer input case sensitive and some of the film inputs have the exact file title. So rather strict. 
    * Small function in this script, as well as a introduction to curl. 
    * Also the use of sed in order to clear content and store it for the quote output. 
* Rotten Tomatoes Scraper
    * This one does not really work as it originally intended. Rotten Tomatoes has changed there top critic pages so the curl | grep searches are out of date. 
    * Grep searches need to be reworked for the new RT page formats. 
    * Really want to update this as I really like the use of curl, grep, and cut on this one. 
* Agenda Tool 
    * Simple agenda tracker for notes specific to dates. 
    * Great introduction to do and if else functions in bash. 
    * This script takes a switch or option of add which gives a output to enter in the date. 
    * Then allows a input of a description, day number, year.
* Reminder Note Tool 
    * Simple Reminder tool creates a file called .remember in $HOME. 
    * Then checks for an option/switch with note or remind me
    * If the option/switch is note then it takes all command line parameters and adds them to the file 
    * If remindme is inputed in the first position, then it expects a search word after and passes that to grep and searches the remember file. 
* Zip Code Lookup
    * Real simple zip code lookup using curl. 
    * Ask for a zip code takes in the input and uses it in curl and searches city-data.com/zips 
* Area Code Lookup
    * Same as the zip code except with area codes. 
    * Simple if else statement to check the input. 
    * Uses input and searches bennetyee.org with curl. 
* Known Vulns Scraper
    * Real simple scraper that searches cisa.gov based on a input that is passed into grep
    * Was made for fun/exploring bash one liners 
* Nginx Logs
    * This was created to monitor error and access logs on a Nginx webserver/reverse proxy. 
    * For my capstone project lunchrush.net we created a node.js application server behind nginx. 
    * As soon as nginx was exposed to the internet we started getting hits on it and a large amount of access and error logs. 
    * In order to digest these logs this bash script reads the access and error logs paths and prints them in a readable format. 
    * Note the accessLogs and errorLogs variables need to be changed in order to fit a specific nginx server.
    * Also depends on custom logging set up in nginx configuration file. 

---

### Others

#### Intro Bash 

* These are a number of scripts with more introductory bash concepts. 
* Sample of else if, for do, functions, input, and output. 

#### Alittle Awk 

* These are sample awk scripts. 
* They all run off a sample csv in the directory. 
* Simple manipulation of data based on the sample.csv file and awk.   

--- 
