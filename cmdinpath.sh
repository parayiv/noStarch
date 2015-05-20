#!/bin/sh

myPath="$(echo $PATH | sed -e 's/:/ /g')"
count=0

for file in $myPath; do
	for command in $(ls $file); do
		if [ -x $file/$command ]; then
			count=$(( count + 1 ))
		fi
	done
done

echo "We have $count commands"
