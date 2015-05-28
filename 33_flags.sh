#!/bin/sh
# newquota - A front end to quota that works with full-word flags a la GNU.

# quota has three possible flags, -g, -v, and -q, but this script
# allows them to be '--group', '--verbose', and '--quiet' too:

flags=""
realls="/bin/ls"

while [ $# -gt 0 ]
do
	case $1 in
		--help | -help) echo "Usage: $0 [ --new --version --quiet ]" >&2 ;
		exit 1 ;;
		--new | -new) flags="$flags -ltr" ;	shift ;;
		--version | -version) flags="$flags" --color=always ; shift ;;
		--quiet | -quiet) flags="$flags -AF"; shift ;;
		-- ) shift ;  break ;;
		*) break ; 
	esac
done

exec $realls $flags "$@"
