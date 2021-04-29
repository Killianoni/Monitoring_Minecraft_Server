#!/bin/bash

clear

#Check directory access
if [ -d $1 ] && [ -r $1 ] && [ -w $1 ]
then
	cd $1
	
	#Grep rcon port
	rconport=$(grep rcon.port server.properties | cut -d'=' -f2)
	mcrcon -p admin1234 -P $rconport "say Saving the world..."
else
	echo "Directory doesn't exist or access restricted"
	exit
fi

#Check if server is u^p
if [ $? -eq 0 ]
then
	#check arguments
        if [ $# = 1 ] 
        then
		#check if backup dir exist
        	if [ -d backup ] 
        	then
            		cp -r world backup
        	else
            		mkdir backup
            		cp -r world backup
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

    cd backup
    #change current name by the date
    mv world $(date +%Y-%m-%d-%H:%Mh)
    cd ..
    mcrcon -p admin1234 -P $rconport "say Backup complete !"
    echo 'Backup complete !'
    echo ""
#Server not up
else
	clear
	echo "Sever isn't started"
	exit
fi
