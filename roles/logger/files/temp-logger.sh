#!/bin/bash
TEMPRATURE=$(vcgencmd measure_temp | cut -c 6-9) 
DATE=$(date +%Y-%m-%d-%H-%M-%S)

echo "$DATE | $TEMPRATURE" >> raspberry_temp.txt
docker exec minecraft-server mc-send-to-console say "Current temprature: $TEMPRATURE"
