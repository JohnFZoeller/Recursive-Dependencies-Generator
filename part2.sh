#!/bin/bash
#
# John Zoeller 
# Homework 3 part 2
#
# Assuming that the input files have at least one line of code.
# also that there is a folder called legacy
#


#set -x;

find legacy -type f |						#find all files
grep -Ev 'DS'|								#only .h or .c types
while read lines; do 						#for each files

	cat $lines | 							#open it to stdout
	while read source; do 					#for each line in file
		if [[ $source = \#* ]] ; then		#if it starts with #
			SR1=${source//\"/};				#remove all quotes
			echo $SR1 | 
			sed 's/\.[a-z]*//g' |			#remove all extensions
			# 2nd line : print #include($1), then a "
			# 3rd line : for the rest of the words after include
			# 4th line : print the word, followed by an _
			# 5th line : add .h" to the end
			awk 'BEGIN{FS=" "; OFS="_";}{	
				printf $1 " \"";			
				for(i=2;i<=NF;i++){
					printf $i;
					if(i != NF)
						printf "_";
				}
				print ".h\""
			}' >> temp.tmp;				#append line to temp
		fi; 
	done; 
	mv temp.tmp $lines;						#replace file contents 
done;


