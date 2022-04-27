#!/bin/bash

# DECLARATIONS START #

  DATE=$(date +%Y-%m-%d-%H-%M-%S)
  ## LCL for local directory
  LCL_BACKUP_DIR="{{ lcl_backup_dir }}/minecraft-worlds"
  ## EXT for external directory
  EXT_BACKUP_DIR="{{ ext_backup_dir }}/minecraft-worlds"
  ## LCL_EXT is used to decide upon where we would like to save backups
  LCL_EXT="{{ lcl_ext }}"

# DECLARATIONS END #

  ## LCL_EXT should return 3 for saving to the both locations,
  ## 2 for saving only to EXTERNAL location and any other to save to LOCAL.
  ## We make a backup of each world folder individually:
  ## 1. World, 2. Nether World, 3. The End World

  if [ LCL_EXT -eq 3 ]
  then
    tar -zcvpf $LCL_BACKUP_DIR/world-$DATE.tar.gz /minecraft-data/world
    tar -zcvpf $LCL_BACKUP_DIR/world_nether-$DATE.tar.gz /minecraft-data/world_nether
    tar -zcvpf $LCL_BACKUP_DIR/world_the_end-$DATE.tar.gz /minecraft-data/world_the_end
    tar -zcvpf $EXT_BACKUP_DIR/world-$DATE.tar.gz /minecraft-data/world
    tar -zcvpf $EXT_BACKUP_DIR/world_nether-$DATE.tar.gz /minecraft-data/world_nether
    tar -zcvpf $EXT_BACKUP_DIR/world_the_end-$DATE.tar.gz /minecraft-data/world_the_end
  elif [ LCL_EXT -eq 2 ]
  then
    tar -zcvpf $EXT_BACKUP_DIR/world-$DATE.tar.gz /minecraft-data/world
    tar -zcvpf $EXT_BACKUP_DIR/world_nether-$DATE.tar.gz /minecraft-data/world_nether
    tar -zcvpf $EXT_BACKUP_DIR/world_the_end-$DATE.tar.gz /minecraft-data/world_the_end
  else
    tar -zcvpf $LCL_BACKUP_DIR/world-$DATE.tar.gz /minecraft-data/world
    tar -zcvpf $LCL_BACKUP_DIR/world_nether-$DATE.tar.gz /minecraft-data/world_nether
    tar -zcvpf $LCL_BACKUP_DIR/world_the_end-$DATE.tar.gz /minecraft-data/world_the_end
  fi

  ## Delete files older than 3 days
  find $BACKUP_DIR/* -mtime +3 -exec rm {} \;
