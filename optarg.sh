#!/bin/sh

while getopts "abcd:" opt; do
	case $opt in
		a) var="Abdennacer" 	;;
		b) var="Parayiv"		;;
		c) var="Moufida"		;;
		d) var="$OPTARG"		;;
	esac
done
shift $(($OPTIND - 1))

echo "Action=$var"
