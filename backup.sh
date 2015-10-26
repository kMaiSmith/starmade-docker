#!/bin/bash

if [ -z $1 ]; then
    echo "you must specify a running or stopped dockerized starmade instance to backup"
    exit 1
fi

mkdir -p backups

INSTANCE_NAME=$!
DATE_TAG=`date +"%Y%m%d-%H%M"`

docker exec starmade_1 tar -czvf /opt/starmade-backup-${DATE_TAG}.tar.gz -C /opt StarMade
docker cp starmade_1:/opt/starmade-backup-${DATE_TAG}.tar.gz backups/

echo "Backup created at backups/starmade-backup-${DATE_TAG}.tar.gz"
