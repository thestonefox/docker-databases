Databases in Docker
===================

Shell helper for launching common databases in docker containers.

Based on the docker database containers provided by [OrchardUp](https://github.com/orchardup)

Requirements
------------

* Docker 0.8+ (from docker.io)

Supported Databases
-------------------

* MySQL - [OrchardUp/Mysql](https://github.com/orchardup/docker-mysql)
* PostgreSQL - [Zaiste/PostgreSQL](https://github.com/zaiste/docker-postgresql)

Installation
------------

1. Git clone this repository `git clone git@github.com:thestonefox/docker-database.git`
2. cd to correct directory `cd docker-databases`

Usage
-----

###Starting a db container
```bash
sudo ./ddb.sh <db-type>
```

**Example:** `sudo ./ddb.sh mysql`

###Terminating a db container
```bash
sudo ./ddb-kill.sh <container-name>
```

**Example:** `sudo ./ddb-kill.sh mysqldb`


Runtime Options
---------------

You can customise the database settings when running the ddb.sh script. The below example will create a new docker mysql container with the following details:

* **mysql username:** myuser
* **mysql password:** mypass
* **mysql default database:** mytestdb
* **docker container name:** mysqldb

###Creating the docker db container

* Step 1. Run the ddb.sh script for mysql: 
```bash
sudo ./ddb.sh mysql
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
* Step 7. Run `sudo docker ps` to list the running docker containers
```bash
CONTAINER ID        IMAGE                        COMMAND               CREATED             STATUS              PORTS                                        NAMES
9f7c38765cd2        orchardup/mysql:latest       /usr/local/bin/run    3 seconds ago       Up 2 seconds        0.0.0.0:3306->3306/tcp                       mysqldb  
```

You should now see your running docker mysql container with the name "mysqldb" with the default mysql port (3306) already mapped through to the container.


###Terminating the container

* Step 1. Run the ddb-kill.sh script passing in the container name to terminate
```bash
sudo ./ddb-kill.sh mysqldb
```
* Step 2. The container will be stopped and then deleted
* Step 3. Run `sudo docker ps` to list the running docker containers
```bash
CONTAINER ID        IMAGE                        COMMAND               CREATED             STATUS              PORTS                                        NAMES
```

You should now see your docker database container has been removed from the containers list.
