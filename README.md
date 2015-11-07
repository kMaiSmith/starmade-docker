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

## Backing up world files

If you want to backup the world data to somewhere outside the docker volumes you can run ./backup.sh.  This script creates and puts a world/blueprint backup in the backups directory from the passed docker instance name.  If the backups director doesn't exist, it is automatically created.  The backups are named as starmade-backup-YYYYmmdd-HHMM.tar.gz
```
./backup.sh starmade_1
```

## Starting a new server from a backup

The ./launch.sh script is capable of taking a second argument which is the path to a backup tarball created from the ./backup.sh.  Before restoring, you should first stop your existing starmade dockerized server that is consuming port 4242; the origonal dockerized starmade server should not be removed until everything has been proven to work on the restored image.  On average hardware, the restore will take about 30 seconds to complete.
```
docker stop starmade_1
./launch.sh starmade_2 backups/starmade-backup-20151101-0120.tar.gz
```

## User specified port options and extra docker args

When running any of the scripts that involve spinning up a new docker contianer (upgrade.sh, launch.sh), the user can now specify port options if the default `-p 4242:4242` isn't satisfactory; the user can also specify extra arguments to pass to the docker create commands. To specify custom port options, export the `STARMADE_PORT_OPTS` environment variable to contain the new port options.  For extra arguments, export the `STARMADE_EXTRA_OPTS` environment variable to contain the extra docker options. 

```
export STARMADE_PORT_OPTS="-p 10.0.0.20:4242:4242"
export STARMADE_EXTRA_OPTS="--restart always"

./launch.sh starmade_1
```
