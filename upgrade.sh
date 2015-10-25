#!/bin/bash

if [ -z $1 ]; then
    echo "you must specify the name of a running starmade docker instance"
    exit 1
fi 

INSTANCE_NAME=$1

NEW_INSTANCE_ID=$(docker create -p 4242:4242 --volumes-from=$INSTANCE_NAME starmade)
docker stop $INSTANCE_NAME && docker rm $INSTANCE_NAME

docker rename $NEW_INSTANCE_ID $INSTANCE_NAME
docker start $INSTANCE_NAME
