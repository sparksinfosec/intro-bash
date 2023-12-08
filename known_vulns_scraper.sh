#!/usr/bin/bash

read -p "Enter in a vendor (use capital first letter Linux, Microsoft): " vendorinput 
rm -r knownvulns.txt	
curl -s https://www.cisa.gov/sites/default/files/feeds/known_exploited_vulnerabilities.json | awk -F'{' '{ print $1}' | awk -F'}' '{print $1}' | grep '"vendorProject":' | cut -d'"' -f 4 | sort | uniq -c | sed "s/^[ \t]*//" >> knownvulns.txt
awk -F' ' '{ sum+=$1 } END { print sum, "total vulnerabilities" }' knownvulns.txt

outputsearch=$(grep "$vendorinput" knownvulns.txt | cut -d' ' -f 1)
echo "$vendorinput has $outputsearch"

