#!/bin/bash

clear

if [ $# = 1 ] 
then
	if [ -d $1 ]
	then
		cd $1 
		rconport=$(grep rcon.port server.properties | cut -d'=' -f2)
		mcrcon -p admin1234 -P $rconport "stop"
		if [ $? -eq 0 ]
		then
			clear
			echo 'Server stopped'
			exit
		else
			clear
			echo 'Server already stopped'
			exit
		fi
	else
		clear
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

