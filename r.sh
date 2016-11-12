#!/bin/bash
#
# John Zoeller
# Homework 3 Part 3 recursion
#

#set -x;

NAME=$(echo $2 | sed 's/\"//g')			# cut out quotes from arg[2] (file name) 
cat $(find dep -name $NAME) |			# find gets path, open file with cat
while read lines; do
	if [[ $lines == *h\" ]] ; then		# line ends with .h? recurse
		echo "$lines";
		sh r.sh $lines;
	fi;
done;
