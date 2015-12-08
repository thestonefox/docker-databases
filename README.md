Databases in Docker
===================

Shell helper for launching common databases in docker containers.

Requirements
------------

* Docker 0.8+ (from docker.io)

Supported Databases
-------------------

* MySQL - [Docker-Library/Mysql](https://github.com/docker-library/mysql)
* PostgreSQL - [Docker-Library/Postgres](https://github.com/docker-library/postgres)
* Redis - [Dockerfile/Redis](https://github.com/dockerfile/redis)
* MongoDB - [Dockerfile/MongoDB](https://github.com/dockerfile/mongodb)


Installation
------------

1. Git clone this repository `git clone git@github.com:thestonefox/docker-databases.git`
2. cd to correct directory `cd docker-databases`

Usage
-----

  > #### Note:
  > You may need to run the below commands with sudo
  > depending on how you installed docker.

###Starting a db container
```bash
./ddb.sh <db-type>
```

**Example:** `./ddb.sh mysql`

###Terminating a db container
```bash
./ddb-kill.sh <container-name>
```

**Example:** `./ddb-kill.sh mysqldb`


Runtime Options
---------------

You can customise the database settings when running the ddb.sh script. 

```bash
# mysql/postgresql only
- username
- password
- database name

# all types
- docker container name
```

The below example will create a new docker mysql container with the following details:

* **mysql username:** myuser
* **mysql password:** mypass
* **mysql default database:** mytestdb
* **docker container name:** mysqldb

###Creating the docker db container

* Step 1. Run the ddb.sh script for mysql: 
```bash
./ddb.sh mysql
```
* Step 2. You will be prompted to enter a default username:
```bash
Please enter db username [default: root]: myuser
```
* Step 3. You will be prompted to enter a default password:
```bash
Please enter db password [default: password]: mypass
```
* Step 4. You will be prompted to enter a default database schema name:
```bash
Please enter db name [default: test]: mytestdb
```
* Step 5. You will be prompted to enter a docker container name:
```bash
Please enter docker container name [default: mysql]: mysqldb
```
* Step 6. When the above details have been entered, the docker container will pull and run and return the container ID
* Step 7. Run `docker ps` to list the running docker containers
```bash
CONTAINER ID        IMAGE                        COMMAND               CREATED             STATUS              PORTS                                        NAMES
9f7c38765cd2        orchardup/mysql:latest       /usr/local/bin/run    3 seconds ago       Up 2 seconds        0.0.0.0:3306->3306/tcp                       mysqldb  
```

You should now see your running docker mysql container with the name "mysqldb" with the default mysql port (3306) already mapped through to the container.


###Terminating the container

* Step 1. Run the ddb-kill.sh script passing in the container name to terminate
```bash
./ddb-kill.sh mysqldb
```
* Step 2. The container will be stopped and then deleted
* Step 3. Run `docker ps` to list the running docker containers
```bash
CONTAINER ID        IMAGE                        COMMAND               CREATED             STATUS              PORTS                                        NAMES
```

You should now see your docker database container has been removed from the containers list.
