#!/bin/bash
#
# John Zoeller
# Homework 3 Part 1b
# renames all bad files
#
#
#

#set -x;

find legacy -type f | 				#get all files
grep -E '\.c|\.h|\.C' | 			#list all file
while read lines; do 				#loop files
	SRC=${lines//\ /_}				#replace spaces
	SR2=${SRC//\"/}					#remove quotes
	SR3=${SR2/\.cxx/\.cpp}
	SR4=${SR3/\.C/\.cpp}
	SR5=${SR4/\.c++/\.cpp}
	SR6=${SR5/\.cc/\.cpp}
	SR7=${SR6/\.hxx/\.h}
	SR8=${SR7/\.hpp/\.h}
	mv "${lines}" "${SR8}";
done;

