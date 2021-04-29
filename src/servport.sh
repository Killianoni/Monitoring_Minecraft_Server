#!/bin/bash

for d in */
do
	cd $d
	if [ -f "server.properties" ]
	then
		port=$(grep server-port server.properties | cut -d'=' -f2)
		cd ..
		echo "$d : $port"
	else
		cd ..
		continue
	fi
done

