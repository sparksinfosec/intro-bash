#!/usr/bin/awk
BEGIN{
	FS=","
	OFS=","
	aCount = 0
	bCount = 0
	cCount = 0
	dcount = 0
	eCount = 0

}
{
        if ($2 >= 90 && $2 <= 100){
                aCount += 1
        } else if ($2 >= 80 && $2 <= 89){
                bCount += 1
        } else if ($2 >= 70 && $2 <= 79){
                cCount += 1
        } else if ($2 >= 60 && $2 <= 69){
                dCount += 1
        } else if ($2 >= 0 && $2 <= 59){
                eCount += 1
        } else {

        }
}
END{
	print "A", aCount
	print "B", bCount
	print "C", cCount
	print "D", dCount
	print "E", eCount
}

