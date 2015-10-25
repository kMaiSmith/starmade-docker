#!/bin/bash

if [ -z $1 ]; then
    echo "you must specify a name for the new starmade docker instance"
    exit 1
fi

INSTANCE_NAME=$1

docker create -p 4242:4242 --name $INSTANCE_NAME -t starmade
docker start $INSTANCE_NAME
