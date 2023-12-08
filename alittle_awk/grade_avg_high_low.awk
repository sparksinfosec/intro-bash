#!/usr/bin/awk
BEGIN{
	FS=","
	OFS=" "
	onlineTotal = 0
	onsiteTotal = 0
	highest = 0
	lowest = 100 
}
{
	if ($3 == "online"){
		onlineTotal += $2
		onlinefieldsprocessed += 1
	} else if ($3 == "onsite"){
		onsiteTotal += $2
		onsitefieldsprocessed += 1
	} else {
	}
}
{
	if ($2 == "Final Grade"){
	      
        } else if ($2 >= highest ){
		highest = $2
	} else if ($2 <= lowest ){
		lowest = $2
	}
	
}

END{
	onsiteAvg = onsiteTotal / onsitefieldsprocessed
	onlineAvg = onlineTotal / onlinefieldsprocessed
	print "Section Average" 
	printf "%.6s %.2f \n", "online ", onlineAvg
	printf "%.6s %.2f \n", "onsite ", onsiteAvg
	print "\n"
	print "Higest grade:", highest
	print "Lowest grade:", lowest
}
