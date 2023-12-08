#!/usr/bin/awk
BEGIN{
	FS=","
}
	NR != 1{
		print $1, "is an", $3, "student"
}
