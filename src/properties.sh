#!/bin/bash

clear

#Arguments check
if [[ $# = 1 ]]
then
	if [ -d $1 ]
	then
    		cd $1
	else
		echo 'Server does not exist'
		exit
	fi
elif [[ $# < 1 ]]
then
    echo "Missing argument"
    exit
elif [[ $# > 1 ]]
then
    echo "Too much arguments"
    exit
fi

#Directory access
if [ -d $pwd ] && [ -r $pwd ] && [ -w $pwd ]
then
	#Grep rcon port
	rconport=$(grep rcon.port server.properties | cut -d'=' -f2)
	
	#Check if server up 
	mcrcon -p admin1234 -P $rconport test
	if [ $? -eq 0 ]
	then
    		#Backup and stop server if up
		clear
	        echo 'This will stop your server do you want to continue ? [Yes:No]'

    		read rep1

    		if [ $rep1 = "Yes" ] || [ $rep1 = "yes" ]
    		then
		cd ..
		sh ./backup.sh $1
		cd $1
		mcrcon -p admin1234 -P $rconport "stop"

  	  	elif [ $rep1 = "no" ] || [ $rep1 = "No" ]
   	 	then
    			echo 'Ok boss dont forget to save your world'
    			exit
   		else
	    		echo 'Wrong answer exiting...'
		    	exit
    		fi

	fi
else 
    echo "Access error to backup directory"
    exit
fi

    #Loop
    while true 
    do
        clear
        echo "Editable properties : "
        echo "====================================="
        grep allow-flight server.properties
        grep rcon.port server.properties
        grep command-block server.properties
        grep difficulty server.properties
        grep -m 1 gamemode server.properties
        grep generate-structure server.properties
        grep level-seed server.properties
        grep max-build server.properties
        grep max-players server.properties
        grep motd server.properties
        grep online server.properties
        grep pvp server.properties
        grep server-port server.properties
        grep spawn-monsters server.properties
        grep spawn-protection server.properties
        grep view-distance server.properties
        grep white-list server.properties
        echo "====================================="
        echo ""
        echo "Which properties you want to edit ? / Type exit to close the script"

        read prop

        #Exit
        if [[ $prop = "exit" ]]
        then
            exit

        #Difficulty
        elif [[ $prop = "difficulty" ]]
        then
            echo "Which difficulty ? [peaceful:easy:normal:hard]"
            read dif
            
            if [[ $dif = "peaceful" ]] || [[ $dif = "easy" ]] || [[ $dif = "normal" ]] || [[ $dif = "hard" ]]
            then

                curdif=$(grep difficulty server.properties | cut -d'=' -f2)
                sed -i -e "s/$prop=$curdif/$prop=$dif/g" server.properties
                rm server.properties-e
                continue
            else 
                echo "Wrong difficulty"
                exit

            fi
        
        #RCON port
        elif [[ $prop = "rcon.port" ]]
        then
            echo "Which port ?"
            read port
            
            #Only numbers
            if [[ $port =~ ^[0-9]+$ ]]
            then
                curport=$(grep rcon.port server.properties | cut -d'=' -f2)
                sed -i -e "s/$prop=$curport/$prop=$port/g" server.properties
                rm server.properties-e
                continue
            else
                echo "Wrong value ! numbers only !"
                exit
            fi
        
        #Gamemode
        elif [[ $prop = "gamemode" ]]
        then

            echo "Which gamemode ? [survival:creative:spectator:adventure]"
            read gm

            if [[ $gm = "survival" ]] || [[ $gm = "creative" ]] || [[ $gm = "adventure" ]] || [[ $gm = "spectator" ]]
            then

                curgm=$(grep -m 1 gamemode server.properties | cut -d'=' -f2)
                sed -i -e "s/$prop=$curgm/$prop=$gm/g" server.properties
                rm server.properties-e
                continue

            else
                echo "Wrong gamemode"
                exit
            fi

        
        #Seed
        elif [[ $prop = "level-seed" ]]
        then

            echo "Which level seed ?"
            read lvseed

            #Only numbers
            if [[ $lvseed =~ ^[0-9]+$ ]]
            then
                curlvseed=$(grep level-seed server.properties | cut -d'=' -f2)
                sed -i -e "s/$prop=$curlvseed/$prop=$lvseed/g" server.properties
                rm server.properties-e
                continue
            else
                echo "Wrong seed, numbers only"
                exit
            fi
        
        #Build height
        elif [[ $prop = "max-build-height" ]]
        then

            echo "How much build height ?"
            read bheight

            #Only numbers
            if [[ $bheight =~ ^[0-9]+$ ]]
            then

                curbheight=$(grep max-build-height server.properties | cut -d'=' -f2)
                sed -i -e "s/$prop=$curbheight/$prop=$bheight/g" server.properties
                rm server.properties-e
                continue
            else
                echo "Wrong height value, numbers only !"
                exit
            fi

        
        #Max players
        elif [[ $prop = "max-players" ]]
        then

            echo "How much players ?"
            read maxp

            #Only numbers
            if [[ $maxp =~ ^[0-9]+$ ]]
            then
                curmaxp=$(grep max-players server.properties | cut -d'=' -f2)
                sed -i -e "s/$prop=$curmaxp/$prop=$maxp/g" server.properties
                rm server.properties-e
                continue
            else
                echo "Wrong max player value, numbers only !"
                exit
            fi

        
        #Message of the day
        elif [[ $prop = "motd" ]]
        then

            echo "What message to print ?"
            read motd

            curmotd=$(grep motd server.properties | cut -d'=' -f2)
            sed -i -e "s/$prop=$curmotd/$prop=$motd/g" server.properties
            rm server.properties-e
            continue

        
        #Server port
        elif [[ $prop = "server-port" ]]
        then

            echo "Which server port"
            read sport

            #Only numbers
            if [[ $sport =~ ^[0-9]+$ ]]
            then

                cursport=$(grep server-port server.properties | cut -d'=' -f2)
                sed -i -e "s/$prop=$cursport/$prop=$sport/g" server.properties
                rm server.properties-e
                continue
            else
                echo "Wrong port value, numbers only !"
                exit
            fi
            
        #Spawn protection
        elif [[ $prop = "spawn-protection" ]]
        then

            echo = "How much server protection"
            read sprot 

            #Only numbers
            if [[ $sprot =~ ^[0-9]+$ ]]
            then

                cursport=$(grep server-protection server.properties | cut -d'=' -f2)
                sed -i -e "s/$prop=$cursprot/$prop=$sport/g" server.properties
                rm server.properties-e
                continue
            else
                echo "Wrong protection value, numbers only !"
                exit
            fi

        
        #View distance
        elif [[ $prop = "view-distance" ]]
        then

            echo "How much view distance"
            read vdist

            #Only numbers
            if [[ $vdist =~ ^[0-9]+$ ]]
            then
                curvdist=$(grep view-distance server.properties | cut -d'=' -f2)
                sed -i -e "s/$prop=$curvdist/$prop=$vdist/g" server.properties
                rm server.properties-e
                continue
            else
                echo "Wrong view distance value, numbers only !"
                exit
            fi

        #Wrong propertie
        else
            echo 'Propertie is not available'
            exit
        fi

        #True/False propertie
        echo "Do you want true or false"
        read setting

        if [[ $setting = "true" ]] || [[ $setting = "false" ]]
        then
            if [[ $setting = "true" ]]
            then
                clear
                sed -i -e "s/$prop=false/$prop=true/g" server.properties
                rm server.properties-e
            
                elif [[ $setting = "false" ]]
                then

                    clear 
                    sed -i -e "s/$prop=true/$prop=false/g" server.properties
                    rm server.properties-e
            
            fi
            #True/False error
            else
                clear
                echo "Wrong arguments [true:false]"
                exit
        fi

    done


