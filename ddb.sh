#!/bin/bash

function mysql() {
  docker run -d -p 3306:3306 \
             -e MYSQL_ROOT_PASSWORD=${password} \
             -e MYSQL_USER=${username} \
             -e MYSQL_PASSWORD=${password} \
             -e MYSQL_DATABASE=${schema} \
             --name ${container} \
             mysql
}

function psql() {
  docker run -d -p 5432:5432 \
             -e POSTGRES_USER=${username} \
             -e POSTGRES_PASSWORD=${password} \
             -e POSTGRES_DB=${schema} \
             --name ${container} \
             postgres
}

function redis() {
  docker run -d -p 6379:6379 \
             --name ${container} \
             dockerfile/redis
}

function mongo() {
  docker run -d -p 27017:27017 \
             --name ${container} \
             dockerfile/mongodb
}

function_exists() {
  declare -f -F $1 > /dev/null
  return $?
}

if [ $# -lt 1 ]
then
  echo "Usage : $0 mysql|psql|redis|mongo "
  exit
fi

if [ $1 = "mysql" ] || [ $1 = "psql" ]
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
  mongo) function_exists mongo && mongo
          ;;
  *)      echo "Invalid database"
          ;;
esac
