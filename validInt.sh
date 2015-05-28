#!/bin/sh

validint(){
	number=$1	min=$2	max=$3
	
	if [ $number -gt $min ]; then
			echo "Integer $number must be less than $min"
			exit 1
	elif [ $max -lt $min ]; then
			echo "Integer $max must be greater than $min"
			exit 1
	else
			return 0
	fi
	
	if [ $number  -gt 100 -o $min -gt 100 -o $max -gt 100 ]; then
			echo "Integer must not exceed 100"
			exit 1
	elif [ $number -lt 0 -o $min -lt 0 -o $max -lt 0];then
			echo "Integer must be greater than 0"
			exit 1
	else
			return 0
	fi
}

if [ $# -ne 4 ]; then
	echo "Usage: $0 int1 int2 int3"; exit 1;
fi

if validint "$1 $2 $3"; then
	echo "That input is a valid integer value within your constraints"
fi
