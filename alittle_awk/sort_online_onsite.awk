#!/usr/bin/awk
BEGIN{
	FS = ","
	onlineCount=0
	onsiteCount=0
}
{
	split($0, CurrentLine, ",")
	if (CurrentLine[3] == "online") {
		onlineCount += 1
	} else if (CurrentLine[3] == "onsite") {
		onsiteCount += 1
	} else {
	
	}
}
END{
	print "online", onlineCount
	print "onsite", onsiteCount
}
