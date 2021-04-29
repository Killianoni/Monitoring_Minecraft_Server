#!/bin/bash

clear

if [ $# = 1 ] 
then
	if [ -d $1 ]
	then
		jfile="$1.jar"
        	cd $1
		rconport=$(grep rcon.port server.properties | cut -d'=' -f2)
		mcrcon -p admin1234 -P $rconport test

		if [ $? -eq 0 ]
		then
			clear
			echo 'Server is already up'
			exit
		else	
			clear
			java -jar $jfile nogui
			
		fi
	else
		echo 'Server does not exist'
		exit
	fi
elif [[ $# > 1 ]]
then
	echo "Too much arguments"
	exit
elif [[ $# < 1 ]]
then
	echo "Missing arguments"
	exit      
fi

