#!/bin/bash

. bin/common

INSTANCE_NAME=$1

NEW_INSTANCE_ID=$(docker create --volumes-from=$INSTANCE_NAME $STARMADE_PORT_OPTS $STARMADE_EXTRA_OPTS $STARMADE_IMAGE_TAG)
docker stop $INSTANCE_NAME && docker rm $INSTANCE_NAME

docker rename $NEW_INSTANCE_ID $INSTANCE_NAME
docker start $INSTANCE_NAME
