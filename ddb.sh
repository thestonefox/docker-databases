#!/bin/bash

function mysql() {
  docker run -d -p 3306:3306 \
             -e MYSQL_ROOT_PASSWORD=${password} \
             -e MYSQL_USER=${username} \
             -e MYSQL_PASSWORD=${password} \
             -e MYSQL_DATABASE=${schema} \
             --name ${container} \
             orchardup/mysql
}

function psql() {
  docker run -d -p 5432:5432 \
             -e POSTGRESQL_USER=${username} \
             -e POSTGRESQL_PASS=${password} \
             -e POSTGRESQL_DB=${schema} \
             --name ${container} \
             zaiste/postgresql
}

function redis() {
  docker run -d -p 6379:6379 \
             --name ${container} \
             dockerfile/redis
}

function_exists() {
  declare -f -F $1 > /dev/null
  return $?
}

if [ "$UID" -ne 0 ]
then
  echo "Please run with sudo"
  exit
fi


if [ $# -lt 1 ]
then
  echo "Usage : $0 mysql|psql|redis "
  exit
fi

if [ $1 != "redis" ]
then
  read -p "Please enter db username [default: root]: " username
  read -p "Please enter db password [default: password]: " password
  read -p "Please enter db name [default: test]: " schema
fi

read -p "Please enter docker container name [default: ${1}]": container

username=${username:-root}
password=${password:-password}
schema=${schema:-test}
container=${container:-$1}

case "$1" in
  mysql)    function_exists mysql && mysql
          ;;
  psql)  function_exists psql && psql
          ;;
  redis) function_exists redis && redis
          ;;
  *)      echo "Invalid database"
          ;;
esac
