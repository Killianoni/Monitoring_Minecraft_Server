#!/bin/bash

if [[ $# = 1 ]]
then

	if [ -d $1 ]
	then
		sh ./stop.sh $1
		cd $1
		rconport=$(grep rcon.port server.properties | cut -d'=' -f2)
    		cd ..

	#loop test rcon stop
	while true
	do
		sleep 3
		mcrcon -p admin1234 -P $rconport test
		if [ $? != 0 ]
		then
			break
		fi
	done

	sh ./start.sh $1
	
	else
		echo 'Server does not exist'
	fi

elif [[ $# > 1 ]]
then
	echo "Too much arguments"

elif [[ $# < 1 ]]
then   
	echo "Missing argument"
fi
