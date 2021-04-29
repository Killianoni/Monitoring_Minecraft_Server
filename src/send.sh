#!/bin/bash

if [[ $# != 2 ]]
then
	echo "Wrong arguments"
else
	if [ -d $1 ] && [ -w $1 ] && [ -r $1 ]
	then
		cd $1	
		rconport=$(grep rcon.port server.properties | cut -d'=' -f2)
		mcrcon -p admin1234 -P $rconport "$2"
			if [ $? -eq 0 ]
			then
				clear
				echo "Success ! You sent : $2"
				exit
			else
				clear
				echo 'Server is not up'
				exit
			fi
    	else
    	echo "Directory doesn't exist or access restricted."
    	fi
fi
