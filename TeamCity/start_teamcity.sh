#!/bin/bash

cd /home/ubuntu/work/Tools/TeamCity

docker-compose up -d

sleep 2

docker-compose logs -f team-server
