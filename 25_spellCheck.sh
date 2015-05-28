#!/bin/sh
# checkspelling - Checks the spelling of a word.
# it need a spell dictionnary called 'spell'

#spell="ispell -l" # if you have ispell installed
spell="ispell" # if you have ispell installed
# if not, just define spell=aspell or
# equivalent
if [ $# -lt 1 ] ; then
	echo "Usage: $0 word or words" >&2; exit 1
fi

for word; do
	if [ $(echo $word | ispell) ]; then
		echo "$word: spelled correctly."
	else
		echo "$word: misspelled."
	fi
done

exit 0
