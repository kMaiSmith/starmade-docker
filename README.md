# Starmade Docker Container

This is a set of scripts and Dockerfiles to create and manage a starmade server in a docker container

## Building

As of now, This hasn't been pushed into the DockerHub docker registery, so the image will have to be built before running.  This may take several minutes to run depending on your internet speed. 
```
docker build -t starmade .
```

## Running

Due to laziness, A script has been created to launch the server.  The script requires a name for the new instane to be passed.
```
./launch.sh starmade_1
```
Alternatively
```
docker run --name starmade_1 -p 4242:4242 -t starmade 
```

## Upgrading

The upgrade.sh script was created to aid in upgrading the server to a newer version without destroying the world data or blueprints.  upgrade.sh requires you to pass an instance name for it to upgrade
```
./upgrade.sh starmade_1
```
