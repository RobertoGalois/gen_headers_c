#!/bin/bash

file_c=''		#temp file .c name
files_h=''		#all .o files String
file_h_def=''	#temp .h define name, example: file_1.h ==> FILE_1_H
h_body=''		#temp body of .h file

#listing all .c and .h files in a String like 'file1.h file2.h file3.h etc
for file in `ls *.c`
do
	if [ $file != 'main.c'  ]
	then
		files_c="$files_c $file"
		file=${file/%.c/.h}
		files_h="$files_h $file"
	fi
done

#for each .c file
for file_h in $files_h
do
	#create .h file
	touch $file_h
	file_name=`echo $file_h | tr '.' '_' | tr '[:lower:]' '[:upper:]'`

	#getting .c file corresponding
	file_c=${file_h/%.h/.c}

	#generate .h header text
	echo "#ifndef $file_name" > $file_h
	echo " #define $file_name" >> $file_h

	#generate .h body text
	cat $file_c | grep -x '^\([a-zA-Z_]\{1,\}[[:blank:]]\{1,\}\)\{1,\}[a-zA-Z_]\{1,\}(.\{1,\})' | cat -e | tr '$' ';' | sed 's/.*/ &/' >> $file_h
	

	#generate .h footer text
	echo "#endif" >> $file_h
done

