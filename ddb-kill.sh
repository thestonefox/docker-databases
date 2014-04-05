#!/bin/bash
if [ "$UID" -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

if [[ -z $1 ]]
 then read -p "Enter docker container name:" container
else
  container=$1
fi

if [[ -z "$container" ]]
  then echo "Invalid container name"
  exit
fi

docker stop ${container} && docker rm ${container}
