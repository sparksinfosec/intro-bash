#!/usr/bin/awk
BEGIN{
	FS=","
}
NR != 1 && $2 > 75{
	print $1
}
