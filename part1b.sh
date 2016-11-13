#!/bin/bash
#
# John Zoeller
# Homework 3 Part 1b
# renames all bad files
#

#set -x;

find legacy -type f | 				#get all files
grep -E '\.c|\.h|\.C' | 			#list all file
while read lines; do 				#loop files
	SRC=${lines//\ /_}				#replace spaces
	SR2=${SRC//\"/}					#remove quotes
	SR3=$(echo $SR2 | sed 's/\.[cC][\+a-zA-Z]*/\.cpp/g')
	SR4=$(echo $SR3 | sed 's/\.h[a-z]*/\.h/g');
	mv "${lines}" "${SR4}";
done;