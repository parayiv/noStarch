#!/bin/sh
#Mon May 18 13:05:03 EDT 2015

validMonth(){
	case $1 in
		1)	month="Jan"	;;
		2)	month="Feb"	;;
		3)	month="Mar"	;;
		4)	month="Apr"	;;
		5)	month="May"	;;
		6)	month="Jun"	;;
		7)	month="Jul"	;;
		8)	month="Aug"	;;
		9)	month="Sep"	;;
		10)	month="Oct"	;;
		11)	month="Nov"	;;
		12)	month="Dec"	;;
		*) echo "$0: Unknown numeric month value $1" >&2; exit 1
	esac
	return 0
}

#begin The main script

if [ $# -ne 3 ]; then
	echo "Usage: $0 month day year" >&2
	echo "Typical input Aug 3 1989 or 8 3 1987" >&2
	exit 1
fi

if [ $3 -lt 999 ]; then
	echo "$0: expected four-digit year value." >&2; exit 1
fi

if [ $2 -gt 31  -o  $2 -lt 0 ]; then
	echo "$0: day must not exceed 31 and must be greater than 0." >&2; exit 1
fi
if [ -z $(echo $1 | sed 's/[[:digit:]]//g') ]; then
	validMonth $1
else
	# Normalize to first three letters, first upper, rest lowercase
	month="$(echo $1 | cut -c1 | tr '[:lower:]' '[:upper:]')"
	month="$month$(echo $1 | cut -c2-3 | tr '[:upper:]' '[:lower:]')"
fi

echo $month $2 $3

exit 0
