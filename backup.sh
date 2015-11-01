#!/bin/bash

if [ -z $1 ]; then
    echo "you must specify a running or stopped dockerized starmade instance to backup"
    exit 1
fi

mkdir -p backups

INSTANCE_NAME=$1
DATE_TAG=`date +"%Y%m%d-%H%M"`

docker run --name starmade_backup --volumes-from $INSTANCE_NAME -v $(pwd)/backups:/backup ubuntu tar -czvf /backup/starmade-backup-${DATE_TAG}.tar.gz -C /opt StarMade
docker rm starmade_backup

echo "Backup created at backups/starmade-backup-${DATE_TAG}.tar.gz"
