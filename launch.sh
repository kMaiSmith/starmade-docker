#!/bin/bash

if [ -z "$1" ]; then
    echo "you must specify a name for the new starmade docker instance"
    exit 1
fi

INSTANCE_NAME=$1

if [ -f "$2" ]; then
    mkdir -p /tmp/starmade_backups
    cp $2 /tmp/starmade_backups/backup.tar.gz

    docker run --name starmade_restore -v /tmp/starmade_backups:/backup starmade tar -xvf /backup/backup.tar.gz -C /opt
    docker create --volumes-from starmade_restore -p 4242:4242 --name $INSTANCE_NAME starmade
    docker rm starmade_restore

    rm -rf /tmp/starmade_backups
else
    docker create -p 4242:4242 --name $INSTANCE_NAME starmade
fi

docker start $INSTANCE_NAME
