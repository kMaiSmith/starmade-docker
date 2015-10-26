#!/bin/bash
cd "$(dirname "$0")"

function shutdown() {
    java -jar StarNet.jar localhost:4242 leSuperPassword /chat Server restaring in 5 seconds
    sleep 5
    java -jar StarNet.jar localhost:4242 leSuperPassword /force_save
    java -jar StarNet.jar localhost:4242 leSuperPassword /shutdown 0
}

trap shutdown SIGTERM SIGINT SIGQUIT SIGHUP

unzip -o /opt/StarMade.zip
cp /opt/server.cfg .
cp /opt/whitelist.txt .
cp /opt/admins.txt .
cp /opt/blacklist.txt .

java -Xms128m -Xmx1024m -jar StarMade.jar -server & wait $!
