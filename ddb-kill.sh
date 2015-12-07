#!/bin/bash
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
