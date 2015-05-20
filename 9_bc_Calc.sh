#!/bin/sh
# bc - wrapper for bc that returs result of a calculation

if [ "$1" = "-p" ] ; then
	precision=$2
	shift 2
else
	precision=2 #default
fi

bc -q << EOF
scale=$precision
$*
quit
EOF

exit 0
