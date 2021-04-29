#!/bin/bash

if [[ $# = 1 ]]
then
	if [ -d $1 ]
	then
		cd $1
		rconport=$(grep rcon.port server.properties | cut -d'=' -f2)
		cd ..
		mcrcon -p admin1234 -P $rconport test
	else
		echo 'Server does not exist'
		exit
	fi
	if [ $? != 0 ]
	then
		if [[ -d $1 ]]
		then
			clear
			echo "Are you sure ? [Yes:No]"
			read answer
			if [ $answer = yes ] || [ $answer = Yes ]
			then
				rm -r $1
				sh ./install.sh $1

			elif [ $answer = no ] || [ $answer = No ]
			then
				echo "Ok exiting the script"
				exit

			else
				echo "Wrong answer"
				exit
			fi
		else
			echo "Server doesn't exist"
		fi
	else
		clear
		echo 'Server is up, close it before reseting'
		exit
	fi
elif [[ $# < 1 ]]
then
	echo "Missing argument"

elif [[ $# > 1 ]]
then
	echo "Too much arguments"
fi
