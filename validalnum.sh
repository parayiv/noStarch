#!/bin/bash

	echo -n "Enter input: "
	read input

	valid_input="$(echo $input | sed -e 's/[^[:alnum:]]//g')"
	echo "Input is: $input"
	echo "Valid is: $valid_input"

	if [ "$valid_input" != "$input" ]; then
			echo "Input must consist of only letters and numbers." 
	else
			echo "Input is valid"
	fi
# Ensure that input consist of letters and numbers

validAlphaNum(){
	compressed=$(echo $1 | sed -e 's/[^[:alnum:]]//g')
	
	if [ "$compressed" != "$input" ];then
			return 1
	else
			return 0
	fi
}

echo -n "Enter input: "
read input

if ! validAlphaNum "$input"; then
	echo "Input must consist of only letters and numbers." >&2
	exit 1
else
	echo "Input is valid"
fi
