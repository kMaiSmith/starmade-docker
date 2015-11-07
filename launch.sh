#!/bin/bash

. bin/common

INSTANCE_NAME=$1

if [ -f "$2" ]; then
    mkdir -p /tmp/starmade_backups
    cp $2 /tmp/starmade_backups/backup.tar.gz

    docker run --name starmade_restore -v /tmp/starmade_backups:/backup starmade tar -xvf /backup/backup.tar.gz -C /opt
    docker create --volumes-from starmade_restore $STARMADE_EXTRA_OPTS $STARMADE_PORT_OPTS --name $INSTANCE_NAME $STARMADE_IMAGE_TAG
    docker rm starmade_restore

    rm -rf /tmp/starmade_backups
else
    docker create $STARMADE_PORT_OPTS --name $INSTANCE_NAME $STARMADE_IMAGE_TAG
fi

docker start $INSTANCE_NAME
