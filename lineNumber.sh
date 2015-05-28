#!/bin/sh
# numberlines - A simple alternative to cat -n, etc

for filename
do
	linecount="1"
	while read line
	do
		echo "${linecount}: $line"
		linecount="$(( $linecount + 1 ))"
	done
done

exit 0
