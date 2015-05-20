#!/bin/sh
# validint -- validates integer input, allowing negative ints too
#	  >> validint -17 -20 25
#	  >> || That input is a valid integer value within your constraints.
#	  >> validint 123.4
#	  >> invalid number format ! Only digits, no commas, spaces, etc.

function validint 
{
	#validate first field. Then test against min value $2 and /or
	# max value $3 if they are suppmied. if they are not supplied, skip these
	# tests.
	
	number="$1"		min="$2"		max="$3"

	if [ -z $number ]; then
			echo "You didn't enter anything.Unacceptable." >&2 ; return 1
	fi

	if [ "${number%{number#?}}" = "-" ]; then  # is first char is '-' signµ?
		testvalue="${number#?}" 	# all but first character
	else
		testvalue="$number"
	fi

	nodigits="$(echo $testvalue | sed 's/[[:digit:]]//g')"

	if [ ! -z $nodigits ]; then
		echo "Invalid number format! Only digits, no commas, spaces, etc." >&2
		return 1
	fi

	if [ ! -z $min ]; then
		if [ "$number" -lt "$min" ]; then
			echo "Your value is too small: Smallest acceptable value is $min">&2
			return 1
		fi
	fi

	if [ ! -z $max ]; then
		if [ "$number" -gt "$max" ]; then
			echo "Your value is too big: Largest acceptable value is $max">&2
			return 1
		fi
	fi

	return 0
}

#Usage: 
if [ $# -ne 4 ]; then
	echo "Usage: $0 number min max" >&2 ; exit 1
fi

if validint "$1 $2 $3"; then
	echo "That input is a valid integr value within your constraints"
fi
