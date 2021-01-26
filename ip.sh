#!/bin/bash

# a script to find out if the ip address is reachable or not 

if (( $# != 1 )); then 
	echo "Provide only one argument"
	exit 1 
fi 

VAR=$1
#IP address regex
REGEX="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[[:digit:]]{1,3}"

#do a regex check 
if ! [[ $VAR =~ $REGEX ]]; then 
	echo "NO ADDRESS PROVIDED"
	exit 2
fi
#BASH REMATCH ALWAYS SPECIFY THE IP YOU HAVE FOUND
IP=${BASH_REMATCH[0]}

#find if ip address is reachable by using ping command 

ping -c4 $1P 

if (( $? == 0 )); then 
	STATUS="ALIVE"
else 
	STATUS="Dead"
fi 

echo "IP found: $IP ($STATUS)"
