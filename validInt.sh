#!/bin/sh

validint()
{
	number="$1"		min="$2" max="$3"
	if [ -z "$number" ]; then
		echo "Nothing entered.Unacceptable" >&2
		exit 1
	fi

	if [ "${number%${number#?}}" = "-" ]; then
		testVal="${number#?}"
	else
		testVal="$number"
	fi

	nodigits=$(echo testVal | sed 's/[[:digit:]]//g')
	if [ ! -z "$nodigits" ]; then
		echo "This is not a valid integer" >&2 
		exit 1
	fi

	if [ ! -z $min ]; then
		if [ "$number" -lt "$min" ]; then
			echo "Your value is too small: smallest acceptable value is $min" >&2
			exit 1
		fi
	fi

	if [ ! -z $max ]; then
		if [ "$number" -gt "$max" ]; then
			echo "Your value is too big: largest acceptable value is $max" >&2
			exit 1
		fi
	fi
return 0
}

if validint "$1" "$2" "$3"; then
	echo "That input is a valid integer value within your constaints"
	fi
