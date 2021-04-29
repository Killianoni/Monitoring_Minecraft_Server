#!/bin/bash

clear

url=https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
newname="$1.jar"
fname="$1"

if [ $# = 1 ] 
then
	if [ -d $1 ]
	then
		echo 'Server already exist'
		exit
	fi
        if [ -d $pwd ] && [ -r $pwd ] && [ -w $pwd ]
        then
                mkdir $fname
                cd $fname
                curl $url -O
            else
                echo "Check access rights to the folder"
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

mv server.jar $newname
java -jar $newname nogui
sed -i -e 's/false/true/g' eula.txt
sed -i -e "s/enable-query=false/enable-query=true/g" server.properties
sed -i -e "s/rcon.password=/rcon.password=admin1234/g" server.properties
sed -i -e "s/enable-rcon=false/enable-rcon=true/g" server.properties
rm server.properties-e
rm eula.txt-e
java -jar $newname nogui


