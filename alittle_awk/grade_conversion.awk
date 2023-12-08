#!/usr/bin/awk
BEGIN{
	FS=","
	OFS="\t"
}
{
	if ($2 >= 90 && $2 <= 100){
		print $1, "A"
	} else if ($2 >= 80 && $2 <= 89){
		print $1, "B"
	} else if ($2 >= 70 && $2 <= 79){
		print $1, "C"
	} else if ($2 >= 60 && $2 <= 69){
		print $1, "D"
	} else if ($2 >= 0 && $2 <= 59){
		print $1, "E"
	} else {

	}
}

