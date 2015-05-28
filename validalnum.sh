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
