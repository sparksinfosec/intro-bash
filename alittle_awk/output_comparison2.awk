#!/usr/bin/awk
BEGIN{
	FS=","
}
	$3 == "online"{
		print $1
}
