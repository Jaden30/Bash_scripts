#!/bin/bash 
# backup all python files from project location 

# this script should take one argument, which is destination path and needs to end with /backup. 

# do an argument check that the script is run when an argument is passed
PROD="/home/oiao1/project/scripts/"
if (( $# != 1 )); then 
	echo "Only two argument is needed, run $0 files to be backed path, destination path"
	exit 1
fi 

# destination path check, to check if destination path ends with #backup 
DESTINATION=$1
if [[ $DESTINATION != */backup  ]]; then 
	echo "Wrong destination path, destination path must end 	with /backup"
	exit 2 
fi 

#creation of a destination folder 
#Creation of a date directory using the format year, month, day, hour, minute and seconds
DATE=$(date +%Y-%M-%D_%H_%M_%S)
mkdir -p $DESTINATION/$DATE

#copy from directory to be copied(in this case, python files from my project. 
cp $PROD/*.py $DESTINATION/$DATE 

# EXIT STATUS TO CHECKK IF COPY COMMAND WORKED 
if (( $? == 0 )); then 
	echo Done
else
	echo Failure
fi
