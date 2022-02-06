#!/bin/bash
DATE=$(date +%Y-%m-%d-%H-%M-%S)
BACKUP_DIR="/home/backup/minecraft-worlds"

# take backup of each world to the tar.gz #
tar -zcvpf $BACKUP_DIR/world-$DATE.tar.gz /minecraft-data/world
tar -zcvpf $BACKUP_DIR/world_nether-$DATE.tar.gz /minecraft-data/world_nether
tar -zcvpf $BACKUP_DIR/world_the_end-$DATE.tar.gz /minecraft-data/world_the_end

# Delete files older than 10 days #
find $BACKUP_DIR/* -mtime +3 -exec rm {} \;
