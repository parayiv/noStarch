#!/bin/sh
# hilow -- A simple number-guessing game

biggest=100					# maximum number possible
guess=0						# guessed by player
guesses=0					# number of guesses made
number=$(( $$ % $biggest ))	# ramdon number between 1 and $biggest

sep="++++++++++++++++++++++++++++"
clear 
echo $sep
echo
echo "++++++Guessing Game+++++++++"
echo
echo $sep


while [ $guess -ne $number ]; do
	echo -n "Guess? "; read guess

	if [ "$guess" -lt $number ]; then
		echo "...Number is bigger!! Than $guess"
	elif [ "$guess" -gt $number ]; then
		echo "...Number is smaller!! Than $guess"
	fi
	guesses=$(( $guesses + 1))
done

echo
echo "Right!! Guessed $number in $guesses guesses."

exit 0
