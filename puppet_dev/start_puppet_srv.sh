#!/bin/bash


docker run -d --net puppet --name puppet-srv2 --hostname puppet puppet-server:1.0.0

sleep 2
docker logs -f puppet-srv2

