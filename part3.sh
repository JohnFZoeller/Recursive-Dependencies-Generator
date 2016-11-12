#!/bin/bash
#
# John Zoeller 
# Homework 3 Part 3
# recursively create dep files for all .cpps
# calls r.sh script for recursion
#
# Assume: dep contains all files
# 			all .deps are saved in the same dir as their .cpp
#			r.sh needs to be in the same directory as this one
#

#set -x;

find dep -type f | grep ".cpp" |				#get all .cpp files 
while read files; do 							#read files with extension
	SR1=$(echo $files | sed 's/\.[a-z]*//g')	#SR1 = path/name
	test -e $SR1".dep";							#if .dep doesnt exist for current file

	if ! (($?)); then	
		echo "exists";
	else 											#files = path/name.cpp
		SR2=$(echo $files | sed 's/.*\//null /g')	#SR2 = null name.cpp (stripped path)
		sh r.sh $SR2 > $SR1".dep";					#call recursive sh: args = [1]null [2]name.cpp
													#save output to dep file
		cat $SR1".dep" |							
		sort | uniq > temp.tmp &&					#get rid of duplicates
		mv temp.tmp $SR1".dep";						#write back to .dep
	fi;
done;



