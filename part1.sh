#!/bin/bash
#
# John Zoeller
# Homework 3 Part 1
# 
# Renames all bad folders

#set -x

ls -1Rp legacy | grep ":" |			#only things with :
sort |
grep -E '\.h|\.c|\ |\"' |			#only things with ' '
while read lines; do 				
	SRC=${lines//\:/} 				#remove :'s
	NEWL=${SRC//\ /_} 				#replace space with _
	NEW2=${NEWL//\"/} 				#remove "'s
	TAR=$(echo $NEW2 | sed 's/\.[a-z]*$//')
									#^^remove last ext
	mv "${SRC}" "${TAR}"; 
done;

