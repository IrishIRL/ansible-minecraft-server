#!/bin/bash
TEMPRATURE=$(vcgencmd measure_temp | cut -c 6-9) 
TEMPRATURE_CONVERTED=${TEMPRATURE%.*}
DATE=$(date +%Y-%m-%d-%H-%M-%S)

echo "$DATE | $TEMPRATURE" >> raspberry_temp.txt
if [ $TEMPRATURE_CONVERTED -gt 65 ]
then
    docker exec minecraft-server mc-send-to-console say "Current temprature: §4$TEMPRATURE"
elif [ $TEMPRATURE_CONVERTED -gt 40 ]
then
    docker exec minecraft-server mc-send-to-console say "Current temprature: §6$TEMPRATURE"
else
    docker exec minecraft-server mc-send-to-console say "Current temprature: §2$TEMPRATURE"
fi
