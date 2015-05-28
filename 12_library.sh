#!/bin/sh
#Library test 
# The line BELOW is sourcing a function in the current dir
# for sourcing we use "." dot

. ./coloredText.sh

echo "${greenb}${yellowf}This is a test for library${reset}" 
echo "${redb}${ulon}This is a second test for library${reset}" 


