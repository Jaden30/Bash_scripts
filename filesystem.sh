#!/bin/bash 
# to check the number of arguments given 


VAR=$1
if (( $# != 1 )); then 
	echo "Only one argument is needed"
	exit 1 
fi
if [ -f $VAR ]; then 

#setting default variables 
	VAR_READ="NO"
	VAR_WRITE="NO"
	VAR_EXECUTE="NO"
	
	if [ -r $VAR ]; then
		VAR_READ="YES"
	fi 
	
	if [ -w $VAR ]; then 
		VAR_WRITE="YES"
	fi 
	
	if [ -x $VAR ]; then 
		VAR_EXECUTE="YES"
	fi 

#summary to be written 
	echo "SUMMARY OF: $VAR"
	echo "READ: $VAR_READ"
	echo "WRITE: $VAR_WRITE"
	echo "EXECUTEABLE: $VAR_EXECUTE" 
elif [-d $VAR ]; then 
	echo "$VAR is a directory"
else
	echo "File does not exist"
fi
