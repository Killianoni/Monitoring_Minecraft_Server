#!/bin/bash

#check argument
if [[ $# = 1 ]]
then
	if [ -d $1 ]
	then
		#check if server is up
		cd $1
		rconport=$(grep rcon.port server.properties | cut -d'=' -f2)
		cd ..
		mcrcon -p admin1234 -P $rconport test
	else
		echo 'Server does not exist'
		exit
	fi
		if [ $? -eq 0 ]
		then
			clear
			echo 'Server is up, close it before deleting files'
			exit
		else

			if [[ -d $1 ]]
			then
				echo "Are you sure ? [Yes:No]"
				read answer
					if [[ $answer = Yes ]] || [[ $answer = yes ]]
					then
						rm -r $1

					elif [[ $answer = no ]] || [[ $answer = No ]]
					then
						echo "Ok exiting the script"
						exit
					
					else
						echo "Wrong answer"
					fi
			else
				echo "Directory doesn't exist"
			fi
		fi
elif [[ $# < 1 ]]
then
	echo "Missing argument"

elif [[ $# > 1 ]]
then
	echo "Too much arguments"
	
fi

